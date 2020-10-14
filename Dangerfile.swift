import Danger
import Foundation

let danger = Danger()

// fileImport: DangerfileExtensions/ChangelogCheck.swift
//checkChangelog()

if danger.git.createdFiles.count + danger.git.modifiedFiles.count - danger.git.deletedFiles.count > 300 {
    warn("Big PR, try to keep changes smaller if you can")
}
// Pull request title validation
let prTitle = danger.github.pullRequest.title
if prTitle.count < 5 {
    warn("PR title is too short. 🙏 Please use this format `[SDK-000] Your feature title` and replace `000` with Jira task number.")
}
// Pull request body validation
if danger.github.pullRequest.body == nil || danger.github.pullRequest.body!.isEmpty {
    warn("PR has no description. 📝 You should provide a description of the changes that have made.")
}

let swiftFilesWithCopyright = danger.git.createdFiles.filter {
    $0.fileType == .swift
        && danger.utils.readFile($0).contains("//  Created by")
}

if !swiftFilesWithCopyright.isEmpty {
    let files = swiftFilesWithCopyright.joined(separator: ", ")
    warn("In Danger JS we don't include copyright headers, found them in: \(files)")
}

SwiftLint.lint(.modifiedAndCreatedFiles(directory: "Sources"), inline: true)

// Support running via `danger local`
if danger.github != nil {
    // These checks only happen on a PR
    if danger.github.pullRequest.title.contains("WIP") {
        warn("PR is classed as Work in Progress")
    }
}
message("🎉 The PR added 1 files changed.dsjhshjfhsd")

markdown("![Alt iphone](https://s3.ap-southeast-1.amazonaws.com/images.deccanchronicle.com/dc-Cover-3e2ftda9jabdn5q9ffti1emnc3-20170929123140.Medi.jpeg)") 
