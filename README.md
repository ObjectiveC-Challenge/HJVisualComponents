# HJVisualComponents
HJVisualComponents is a visual component framework. Components:
- Radio button

---

# Table of contents
* [Radio button](#Radio-button)
* [Instalation](#Instalation)
* [Get started](#Get-started)
* [Documentation](#Documentation)

---

# Radio button
## Screenshots

<img src="https://user-images.githubusercontent.com/16090350/127322206-75154ef1-569f-4f36-ac25-1b1c7cadee0e.png" width="300" height="320" />

--- 

# Instalation
## Swift Package Manager
Add dependency:
```swift
.package(url: "https://github.com/ObjectiveC-Challenge/HJVisualComponents.git", from: "1.0.9")
```
or

1. In your project click: File -> Swift Packages -> Add Package Dependency... 
2. Then, paste https://github.com/ObjectiveC-Challenge/HJVisualComponents 
3. Then next -> next

---

# Get started
1. Import HJVisualComponents

```swift
import HJVisualComponents
```

2. Create a Radio Button

```swift
let radioButtonDefault = RadioButton() // Default init
let radioButtonCustom = RadioButton(multiplier: 0.5, selectedColor: .black, unselectedColor: .gray, fontColor: .black) // Custom init
```

3. Setup options

```swift
radioButtonDefault.setOptions(["A", "B", "C"])
```

4. Setup radio buttons dimensions 

```swift
NSLayoutConstraint.activate([
    radioButton.widthAnchor.constraint(equalToConstant: 300),
    radioButton.heightAnchor.constraint(equalToConstant: 100)
])
```

---

# Documentation
## Radio Button
### Functions
#### Custom init
Custom init allows you to set the following parameters:
- multiplier: Button size relative to parent view
- selectedColor: Button color when selected
- unselectedColor: Button color when not selected
- fontColor: Color of the label below the button

```swift
RadioButton(multiplier: 0.5, selectedColor: .blue, unselectedColor: .red, fontColor: .gray)
```

#### Default init
Default init have default values to:
- multiplier: 0.5
- selectedColor: UIColor.black
- unselectedColor: UIColor.gray
- fontColor: UIColor.black

```swift
RadioButton()
```

#### setOptions
Use this function to configure the quantity and values of radio button's options. The options must be a String Array.

```swift
radioButton.setOptions(["A", "B", "C"])
```

#### getSelectedLabel
Use this function to return the selected option. If there aren't select options, this function returns nil.

```swift
radioButton.getSelectedLabel()
```
