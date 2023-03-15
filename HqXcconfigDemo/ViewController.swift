//
//  ViewController.swift
//  HqXcconfigDemo
//
//  Created by hehuiqi on 2023/3/14.
//

import UIKit




class ViewController: UIViewController {
    
    lazy var apiInfoLab: UILabel = {
        let lab = UILabel.init()
        lab.font = UIFont.systemFont(ofSize: 20)
        lab.textColor = UIColor.purple
        lab.frame = self.view.frame
        lab.textAlignment = .center
        lab.numberOfLines = 0
        return lab
    }()
    
    
    func targetType() -> String{
        
        let target_type = Bundle.main.infoDictionary?["APP_TARGET_TYPE"] as? String ?? "product"
        return target_type
    }
    
    func apiInfo() -> String {
        //获取info.plist配置的api信息
        let api_protocal = Bundle.main.infoDictionary?["API_PROTOCAL"] as? String ?? ""
        let api_host = Bundle.main.infoDictionary?["API_HOST"] as? String ?? ""
        let target_type = targetType()

        print(api_protocal,api_host,target_type)
        return api_protocal + "://" + api_host + "\nTarget Type:" + target_type
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.apiInfoLab)
        self.apiInfoLab.text = self.apiInfo()
        
        let target_type = targetType()
        //根据不同的target显示不同的样式或页面
        if target_type == "dev" {
            self.apiInfoLab.textColor = UIColor.blue
        }
        
    }


}

