# UIDatePickerController
iOS native style like Date picker

[![UIDatePickerController](https://github.com/ZaidPathan/UIDatePickerController/blob/master/demo.png)](https://github.com/ZaidPathan/UIDatePickerController)

# Features
_
- Easy to use
- `Swift3+` and `Xcode8+`


# Easy to Use
_

- Add `UIDatePickerController.swift` file to your project.
- Add below code.
    
    UIDatePickerController.pickDate(title: "Choose Date", pickTitle: "Select", cancelTitle: "Cancel", delegate: self)

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
_
- Support orientation
- More customizable
