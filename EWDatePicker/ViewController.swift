//
//  ViewController.swift
//  EWDatePicker
//
//  Created by Ethan.Wang on 2018/8/27.
//  Copyright © 2018年 Ethan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var currentDateCom: DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())

    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 250, width: ScreenInfo.Width - 200, height: 50))
        label.textAlignment = .center
        label.backgroundColor = UIColor.colorWithRGBA(r: 255, g: 51, b: 102, a: 1)
        return label
    }()
    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 450, width: ScreenInfo.Width - 200, height: 50))
        button.addTarget(self, action: #selector(onClickSelectButton), for: .touchUpInside)
        button.setTitleColor(UIColor.colorWithRGBA(r: 255, g: 51, b: 102, a: 1), for: .normal)
        button.setTitle("选择日期", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(label)
        self.view.addSubview(button)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func onClickSelectButton(){
        let dataPicker = EWDatePickerViewController()
        self.definesPresentationContext = true
        /// 回调显示方法
        dataPicker.backDate = { [weak self] date in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            let dateString: String = dateFormatter.string(from: date)
            self?.label.text = dateString
        }
        dataPicker.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        dataPicker.picker.reloadAllComponents()
        /// 弹出时日期滚动到当前日期效果
        self.present(dataPicker, animated: true) {
            dataPicker.picker.selectRow(0, inComponent: 0, animated: true)
            dataPicker.picker.selectRow((self.currentDateCom.month!) - 1, inComponent: 1, animated:   true)
            dataPicker.picker.selectRow((self.currentDateCom.day!) - 1, inComponent: 2, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

