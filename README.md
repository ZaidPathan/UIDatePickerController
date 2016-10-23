# UIDatePickerController
iOS native style like Date picker

[![UIDatePickerController](https://github.com/ZaidPathan/UIDatePickerController/blob/master/demo.png)](https://github.com/ZaidPathan/UIDatePickerController)

# Easy to Use
___
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
