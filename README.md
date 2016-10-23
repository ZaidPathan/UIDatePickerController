# UIDatePickerController
iOS native style like Date picker

[![UIDatePickerController](https://github.com/ZaidPathan/UIDatePickerController/blob/master/demo.png)](https://github.com/ZaidPathan/UIDatePickerController)

# Features
- Easy to use
- `Swift3+` and `Xcode8+`


# Easy to Use
- Add `UIDatePickerController.swift` file to your project.
- Show date picker using below code.

      `UIDatePickerController.pickDate(title: "Choose Date", pickTitle: "Select", cancelTitle: "Cancel", delegate: self)`
      
Handle `UIDatePickerControllerDelegate`:
    
    extension YourViewController:UIDatePickerControllerDelegate{
        func didPickDate(data: Date?) {
            print(data!)
        }
    
        func didCancelPickingDate() {
            print("didCancelPickingDate")
        }
    }


# To do
- Support orientation
- More customizable
