# UIDatePickerController
iOS native style like Date picker

[![UIDatePickerController](https://github.com/ZaidPathan/UIDatePickerController/blob/master/Simulator%20Screen%20Shot%2024-Oct-2016%2C%201.45.26%20AM.png)](https://github.com/ZaidPathan/UIDatePickerController)


[![UIDatePickerController](https://github.com/ZaidPathan/UIDatePickerController/blob/master/Simulator%20Screen%20Shot%2024-Oct-2016%2C%201.45.26%20AM.png)](https://github.com/ZaidPathan/UIDatePickerController)

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
