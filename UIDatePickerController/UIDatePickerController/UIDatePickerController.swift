//
//  UIDatePickerController.swift
//  UIDatePickerController
//
//  Created by Zaid Pathan on 24/10/16.
//  Copyright © 2016 Zaid Pathan. All rights reserved.
//

import UIKit

struct PickerConstants{
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    static let pickerWidth = 350
    static let pickerHeight = 300
}

protocol UIDatePickerControllerDelegate {
    func didPickDate(data:Date?)
    func didCancelPickingDate()
}

class UIDatePickerController: UIViewController {
    var delegate:UIDatePickerControllerDelegate?
    var pickerTitle:String?
    var pickTitle:String?
    var cancelTitle:String?
    var backgroundView:UIView?
    var lblTitle:UILabel?
    var pickerContainerView:UIVisualEffectView?
    var rootVC:UIViewController?
    var datePicker:UIDatePicker?
    var titleLabel:UILabel?
    var pickButton:UIButton?
    var cancelButton:UIButton?
    
    public class func pickDate(title:String?,pickTitle:String?,cancelTitle:String?,delegate:UIDatePickerControllerDelegate?){
        UIApplication.shared.keyWindow?.rootViewController?.addChildViewController(UIDatePickerController(title: title, pickTitle: pickTitle, cancelTitle: cancelTitle,delegate:delegate))
    }
    
    convenience init(title:String?,pickTitle:String?,cancelTitle:String?,delegate:UIDatePickerControllerDelegate?) {
        self.init()
        rootVC = UIApplication.shared.keyWindow?.rootViewController
        self.pickerTitle = title
        self.pickTitle = pickTitle
        self.cancelTitle = cancelTitle
        self.delegate = delegate
        
        setupPickerView()
        return
    }
    
    func shared(){
        
    }
    
    private func setupPickerView(){
        self.view.backgroundColor = UIColor.clear
        addBlurrEffectView()
    }
    
    private func addBlurrEffectView(){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.extraLight)
        pickerContainerView = UIVisualEffectView(effect: blurEffect)
        pickerContainerView?.layer.cornerRadius = 15
        pickerContainerView?.clipsToBounds = true
        pickerContainerView?.frame = CGRect(x: 0, y: 0, width: PickerConstants.pickerWidth, height: PickerConstants.pickerHeight)
        pickerContainerView?.center = self.view.center
        pickerContainerView?.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addTitleLabel()
        self.addDatePicker()
        self.addHorizontalSeperator()
        self.addVerticalSeperator()
        self.addButtons()
        view.addSubview(pickerContainerView!)
        
        
        rootVC?.addChildViewController(self)
        rootVC?.view.addSubview(self.view)
        self.didMove(toParentViewController: self)
    }
    
    private func addTitleLabel(){
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: PickerConstants.pickerWidth, height: 50))
        titleLabel?.font = UIFont.boldSystemFont(ofSize: (titleLabel?.font.pointSize)!)
        titleLabel?.textAlignment = NSTextAlignment.center
        titleLabel?.text = pickerTitle
        pickerContainerView?.addSubview(titleLabel!)
    }
    
    private func addDatePicker(){
        datePicker = UIDatePicker(frame: CGRect(x: 0, y: 50, width: PickerConstants.pickerWidth, height: 200))
        
        pickerContainerView?.addSubview(datePicker!)
    }
    
    func actionCancel(){
        delegate?.didCancelPickingDate()
        close()
    }
    
    func actionSelect(){
        delegate?.didPickDate(data: datePicker?.date)
        close()
    }
    
    private func close(){
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }

    private func addButtons(){
        cancelButton = UIButton(frame: CGRect(x: 0, y: 251, width: (PickerConstants.pickerWidth-1)/2, height: 49))
        cancelButton?.addTarget(self, action: #selector(actionCancel), for: UIControlEvents.touchUpInside)
        cancelButton?.setTitle(cancelTitle, for: UIControlState.normal)
        cancelButton?.setTitleColor(view.tintColor, for: UIControlState.normal)
        pickerContainerView?.addSubview(cancelButton!)
        
        pickButton = UIButton(frame: CGRect(x: (PickerConstants.pickerWidth+1)/2, y: 251, width: (PickerConstants.pickerWidth-1)/2, height: 49))
        pickButton?.addTarget(self, action: #selector(actionSelect), for: UIControlEvents.touchUpInside)
        pickButton?.setTitle(pickTitle, for: UIControlState.normal)
        pickButton?.setTitleColor(view.tintColor, for: UIControlState.normal)
        pickerContainerView?.addSubview(pickButton!)
    }
    
    private func addHorizontalSeperator(){
        let seperator = UIView(frame: CGRect(x: 0, y: 250, width: PickerConstants.pickerWidth, height: 1))
        seperator.backgroundColor = UIColor.gray
        pickerContainerView?.addSubview(seperator)
    }
    
    private func addVerticalSeperator(){
        let seperator = UIView(frame: CGRect(x: (PickerConstants.pickerWidth-1)/2, y: 250, width: 1, height: 49))
        seperator.backgroundColor = UIColor.gray
        pickerContainerView?.addSubview(seperator)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
