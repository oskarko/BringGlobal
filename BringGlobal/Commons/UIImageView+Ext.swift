//
//  UIImageView+Ext.swift
//  BringGlobal
//
//  Created by Oscar Rodriguez Garrucho on 3/2/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImage(from url: String) {
        let url = URL(string: url)!

        loadData(url: url) { (data, error) in
            if let data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
    }
    
    private func loadData(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        // Compute a path to the URL in the cache
        let fileCachePath = FileManager.default.temporaryDirectory
            .appendingPathComponent(
                url.lastPathComponent,
                isDirectory: false
            )
        
        // If the image exists in the cache,
        // load the image from the cache and exit
        if let data = try? Data(contentsOf: fileCachePath) {
            completion(data, nil)
            return
        }
        
        // If the image does not exist in the cache,
        // download the image to the cache
        download(url: url, toFile: fileCachePath) { (error) in
            let data = try? Data(contentsOf: fileCachePath)
            completion(data, error)
        }
    }
    
    private func download(url: URL, toFile file: URL, completion: @escaping (Error?) -> Void) {
        // Download the remote URL to a file
        let task = URLSession.shared.downloadTask(with: url) {
            (tempURL, response, error) in
            // Early exit on error
            guard let tempURL = tempURL else {
                completion(error)
                return
            }

            do {
                // Remove any existing document at file
                if FileManager.default.fileExists(atPath: file.path) {
                    try FileManager.default.removeItem(at: file)
                }

                // Copy the tempURL to file
                try FileManager.default.copyItem(
                    at: tempURL,
                    to: file
                )

                completion(nil)
            }

            // Handle potential file system errors
            catch let fileError {
                completion(fileError)
            }
        }

        // Start the download
        task.resume()
    }
}
