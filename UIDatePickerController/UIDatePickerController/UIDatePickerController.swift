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

@objc protocol UIDatePickerControllerDelegate {
    func didPickDate(data:Date?)
    @objc optional func didCancelPickingDate()
}

class UIDatePickerController: UIViewController {
    weak var delegate:UIDatePickerControllerDelegate?
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
    
    public class func pickDate(title:String?,pickTitle:String?,cancelTitle:String?,delegate:UIDatePickerControllerDelegate?, mode: UIDatePicker.Mode = .date) {
        UIApplication.shared.keyWindow?.rootViewController?.addChildViewController(UIDatePickerController(title: title, pickTitle: pickTitle, cancelTitle: cancelTitle,delegate:delegate, mode: mode))
    }
    
    convenience init(title:String?,pickTitle:String?,cancelTitle:String?,delegate:UIDatePickerControllerDelegate?, mode: UIDatePicker.Mode = .date) {
        self.init()
        rootVC = UIApplication.shared.keyWindow?.rootViewController
        self.pickerTitle = title
        self.pickTitle = pickTitle
        self.cancelTitle = cancelTitle
        self.delegate = delegate
        
        setupPickerView(mode)
        return
    }
    
    func shared(){
        
    }
    
    private func setupPickerView(_ mode: UIDatePicker.Mode){
        self.view.backgroundColor = UIColor.clear
        addBlurrEffectView(mode)
    }
    
    private func addBlurrEffectView(_ mode: UIDatePicker.Mode){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
        pickerContainerView = UIVisualEffectView(effect: blurEffect)
        pickerContainerView?.layer.cornerRadius = 15
        pickerContainerView?.clipsToBounds = true
        pickerContainerView?.frame = CGRect(x: 0, y: 0, width: PickerConstants.pickerWidth, height: PickerConstants.pickerHeight)
        pickerContainerView?.center = self.view.center
        pickerContainerView?.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addTitleLabel()
        self.addDatePicker(mode)
        self.addHorizontalSeperator()
        self.addVerticalSeperator()
        self.addButtons()
        view.addSubview(pickerContainerView ?? UIView())
        
        
        rootVC?.addChildViewController(self)
        rootVC?.view.addSubview(self.view)
        self.didMove(toParentViewController: self)
    }
    
    private func addTitleLabel(){
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: PickerConstants.pickerWidth, height: 50))
        titleLabel?.font = UIFont.systemFont(ofSize: (titleLabel?.font.pointSize ?? 0))
        titleLabel?.textAlignment = NSTextAlignment.center
        titleLabel?.text = pickerTitle
        pickerContainerView?.contentView.addSubview(titleLabel ?? UIView())
    }
    
    private func addDatePicker(_ mode: UIDatePicker.Mode){
        datePicker = UIDatePicker(frame: CGRect(x: 0, y: 50, width: PickerConstants.pickerWidth, height: 200))
        datePicker?.datePickerMode = mode
        pickerContainerView?.contentView.addSubview(datePicker ?? UIView())
    }
    
    @objc func actionCancel(){
        delegate?.didCancelPickingDate?()
        close()
    }
    
    @objc func actionSelect(){
        delegate?.didPickDate(data: datePicker?.date)
        close()
    }
    
    private func close(){
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
    
    private func addButtons(){
        cancelButton = UIButton(frame: CGRect(x: 0, y: 251, width: (PickerConstants.pickerWidth-1)/2, height: 49))
        cancelButton?.addTarget(self, action: #selector(actionCancel), for: UIControl.Event.touchUpInside)
        cancelButton?.setTitle(cancelTitle, for: UIControl.State.normal)
        cancelButton?.setTitleColor(view.tintColor, for: UIControl.State.normal)
        pickerContainerView?.contentView.addSubview(cancelButton ?? UIView())
        
        pickButton = UIButton(frame: CGRect(x: (PickerConstants.pickerWidth+1)/2, y: 251, width: (PickerConstants.pickerWidth-1)/2, height: 49))
        pickButton?.addTarget(self, action: #selector(actionSelect), for: UIControl.Event.touchUpInside)
        pickButton?.setTitle(pickTitle, for: UIControl.State.normal)
        pickButton?.setTitleColor(view.tintColor, for: .normal)
        pickerContainerView?.contentView.addSubview(pickButton ?? UIView())
    }
    
    private func addHorizontalSeperator(){
        let seperator = UIView(frame: CGRect(x: 0, y: 250, width: PickerConstants.pickerWidth, height: 1))
        seperator.backgroundColor = UIColor.gray
        pickerContainerView?.contentView.addSubview(seperator)
    }
    
    private func addVerticalSeperator(){
        let seperator = UIView(frame: CGRect(x: (PickerConstants.pickerWidth-1)/2, y: 250, width: 1, height: 49))
        seperator.backgroundColor = UIColor.gray
        pickerContainerView?.contentView.addSubview(seperator)
    }
    
}
