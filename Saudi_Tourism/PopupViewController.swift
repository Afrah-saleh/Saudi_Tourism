//
//  PopupViewController.swift
//  SlidingIntroScreen
//
//  Created by Muna Aiman Al-hajj on 11/07/1445 AH.
//

import UIKit

class PopupViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupPageControl()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupPages()
    }

    private func setupScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
    }

    private func setupPageControl() {
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10)
        ])
    }

    private func setupPages() {
        let communityGuidelinesItems = [
            ("Warm Welcome", "Embrace the vibrant community spirit.\nFoster good vibes and positivity."),
            // Add all other items from Community Guidelines here
        ]
        let localityPhrasesItems = [
            ("Warm Welcoming", "\"Ya Hala Ya Hala Yallah, Inik Tahiyyehum\""),
            // Add all other items from Locality Phrases here
        ]

        let page1 = createPage(title: "Community Guidelines for a Positive and Stylish Experience", items: communityGuidelinesItems)
        let page2 = createPage(title: "Locality Phrases you could use with local people", items: localityPhrasesItems)

        let pages = [page1, page2]

        for (index, page) in pages.enumerated() {
            scrollView.addSubview(page)
            page.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                page.leadingAnchor.constraint(equalTo: index == 0 ? scrollView.leadingAnchor : pages[index - 1].trailingAnchor),
                page.topAnchor.constraint(equalTo: scrollView.topAnchor),
                page.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                page.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
            ])
        }

        NSLayoutConstraint.activate([
            pages.last!.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
    }

    private func createPage(title: String, items: [(String, String)]) -> UIView {
        let page = UIView()
        
        // Create and setup the titleLabel
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textAlignment = .center
        page.addSubview(titleLabel)
        
        var lastAnchor = titleLabel.bottomAnchor
        for (index, item) in items.enumerated() {
            // Create and setup the item label
            let itemLabel = UILabel()
            itemLabel.translatesAutoresizingMaskIntoConstraints = false
            itemLabel.numberOfLines = 0
            itemLabel.text = "\(index + 1). \(item.0)"
            itemLabel.font = UIFont.systemFont(ofSize: 18)
            page.addSubview(itemLabel)

            // Create and setup the detail label
            let detailLabel = UILabel()
            detailLabel.translatesAutoresizingMaskIntoConstraints = false
            detailLabel.numberOfLines = 0
            detailLabel.text = item.1
            detailLabel.font = UIFont.systemFont(ofSize: 14)
            detailLabel.textColor = .gray
            page.addSubview(detailLabel)

            NSLayoutConstraint.activate([
                itemLabel.topAnchor.constraint(equalTo: lastAnchor, constant: 10),
                itemLabel.leadingAnchor.constraint(equalTo: page.leadingAnchor, constant: 16),
                itemLabel.trailingAnchor.constraint(equalTo: page.trailingAnchor, constant: -16),

                detailLabel.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 5),
                detailLabel.leadingAnchor.constraint(equalTo: itemLabel.leadingAnchor),
                detailLabel.trailingAnchor.constraint(equalTo: itemLabel.trailingAnchor)
            ])

            lastAnchor = detailLabel.bottomAnchor
        }

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: page.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: page.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: page.trailingAnchor, constant: -16)
        ])
        
        return page
    }
}

// Extension for UIScrollViewDelegate
extension PopupViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
