//
//  ViewController.swift
//  AdvancedPageControl
//
//  Created by Mohanned Binmiskeen on 01/05/2020.
//  Copyright (c) 2020 Mohanned Binmiskeen. All rights reserved.
//

import AdvancedPageControl
import UIKit

class ViewController: UIViewController,
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout
{
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pageControl1: AdvancedPageControlView!
    @IBOutlet var pageControl2: AdvancedPageControlView!
    @IBOutlet var pageControl3: AdvancedPageControlView!
    @IBOutlet var pageControl4: AdvancedPageControlView!
    @IBOutlet var pageControl5: AdvancedPageControlView!
    @IBOutlet var pageControl6: AdvancedPageControlView!
    @IBOutlet var pageControl7: AdvancedPageControlView!
    @IBOutlet var pageControl8: AdvancedPageControlView!
    @IBOutlet var pageControl9: AdvancedPageControlView!
    @IBOutlet var pageControl10: AdvancedPageControlView!
    @IBOutlet var pageControl11: AdvancedPageControlView!
    @IBOutlet var pageControll12: AdvancedPageControlView!
    @IBOutlet var pageControll13: AdvancedPageControlView!
    @IBOutlet var pageControll14: AdvancedPageControlView!
    
    func numberOfSections(in _: UICollectionView) -> Int {
        return Constants.pagesCount
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout _: UICollectionViewLayout,
                        sizeForItemAt _: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.width, height: 250)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width

        pageControl1.setPage(Int(round(offSet / width)))
        pageControl2.setPage(Int(round(offSet / width)))
        pageControl3.setPageOffset(offSet / width)
        pageControl4.setPage(Int(round(offSet / width)))
        pageControl5.setPage(Int(round(offSet / width)))
        pageControl6.setPage(Int(round(offSet / width)))
        pageControl7.setPage(Int(round(offSet / width)))
        pageControl8.setPage(Int(round(offSet / width)))
        pageControl9.setPage(Int(round(offSet / width)))
        pageControl10.setPage(Int(round(offSet / width)))
        pageControl11.setPage(Int(round(offSet / width)))
        pageControll12.setPage(Int(round(offSet / width)))
        pageControll13.setPage(Int(round(offSet / width)))
        pageControll14.setPage(Int(round(offSet / width)))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.layer.cornerRadius = 32
        pageControl1.drawer = ColorBlendDrawer(numberOfPages: Constants.pagesCount)
        pageControl2.drawer = DropDrawer()
        pageControl3.drawer = ExtendedDotDrawer(numberOfPages: Constants.pagesCount,
                                                space: 16.0,
                                                indicatorColor: UIColor.green,
                                                dotsColor: .gray,
                                                isBordered: false,
                                                borderWidth: 0.0,
                                                indicatorBorderColor: .clear,
                                                indicatorBorderWidth: 0.0)
        pageControl4.drawer = JumpDrawer(numberOfPages: Constants.pagesCount)
        pageControl5.drawer = ScaleDrawer(numberOfPages: Constants.pagesCount)
        pageControl6.drawer = SlideDrawer(numberOfPages: Constants.pagesCount)
        pageControl7.drawer = SwapDrawer(numberOfPages: Constants.pagesCount,
                                         dotsColor: .clear,
                                         isBordered: true,
                                         borderColor: .white,
                                         borderWidth: 2)

        pageControl8.drawer = ThinWormDrawer()
        pageControl9.drawer = ThinWormHeadsDrawer()
        pageControl10.drawer = WormDrawer()
        pageControl11.drawer = InfiniteDrawer(numberOfPages: Constants.pagesCount, indicatorColor: .white)
        pageControll12.drawer = ScrollingDrawer(numberOfPages: Constants.pagesCount)

        pageControl11.drawer = InfiniteDrawer(numberOfPages: Constants.pagesCount, dotsColor: .lightGray)
        pageControl11.drawer.currentItem = 0

        pageControll13.drawer = DecreasingDrawer(numberOfPages: Constants.pagesCount, dotsColor: .lightGray)
        pageControll13.drawer.currentItem = 0

        pageControll14.drawer = StaticDrawer(numberOfPages: Constants.pagesCount)
        pageControll14.drawer.currentItem = 0

        pageControl11.setNeedsDisplay()
    }

    private enum Constants {
        static let pagesCount: Int = 10
    }

}
