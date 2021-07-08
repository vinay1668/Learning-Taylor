# Learning-Taylor

## Basic functions
1.square root function (sqrt)
```
(def! sqrt (fn* (num)
      ( println (* num num) )
   )
)
```

## Examples
1.A Simple button that change the text to pre-defined value or string.

```
::Text[result:@v]{label="dummyOutput"}
<buttontry:(react-button{ "style"{
                                  "width" 60 
                                  "height" 30
                                  "backgroundColor" "black"
                                  "margin" "50px"
                                  }
          "onClick" (fn*() (set-state "dummyOutput" "100"))
                    }"button")>
   ```
              
 2.The same above example but this takes input from the user.

                    
 ```
 ::Text[@d]{label="dummyOutput"}
<inputtry: (react-input {
                         "placeholder" "trying the input box..." 
                         "onChange" (fn*(val) (set-state "changeDum" val))
})
>
<buttontry:(react-button{ "style"{
                                  "width" 60 
                                  "height" 30
                                  "backgroundColor" "black"
                                  "margin" "50px"
                                  }
          "onClick" (fn*() (set-state "dummyOutput" (get-state "changeDum")))
                    }"button")>
  ```
  
  3.Changing Multiple texts on click using do
  
  ```
  ::Text[text1:  @d]{label="outputOne"}
::Text[text2:  @d]{label="outputTwo"}

<inputtry: (react-input {
                         "placeholder" "trying the input box..." 
                         "onChange" (fn*(val) (do
                         (set-state "changedInput" val)
                         (set-state "changeInput"  "Hello")
                         ))
})
>
<buttontry:(react-button{ "style"{
                                  "width" 60 
                                  "height" 30
                                  "margin" "50px"
                                  }
          "onClick" (fn*() 
          (do
          (set-state "outputOne"  (get-state "changedInput"))  
          (set-state "outputTwo"  (get-state "changeInput"))  
          )
          )
        }"button")>
                 
  ```
  4. Taking the input as a number from user.
  ```
  ::Text[text1:  @d]{label="outputOne"}
::Text[Type:  @t]{label="type"}

<inputtry: (react-input {
                         "placeholder" "trying the input box..." 
                         "onChange" (fn*(val) (do
                         (set-state "changedInput" val)
                         ))
})
>
<buttontry:(react-button{ "style"{
                                  "width" 60 
                                  "height" 30
                                  "margin" "50px"
                                  }
          "onClick" (fn*() 
          (do
           (set-state "outputOne"  (get-state "changedInput" ))
           (set-state "type" (number? (number (get-state "changedInput"))) )
          )
          )
        }"button")>
  ```
  5.Checks if the Input is zero
  ```
  ::Text[text1:  @v]{label="outputOne"}
::Text[result:  @l]{label="result"}


<inputtry: (react-input {
                         "placeholder" "trying the input box..." 
                         "onChange" (fn*(val) (do
                         (set-state "changedInput" val)
                         ))
})
>
<buttontry:(react-button{ "style"{
                                  "width" 60 
                                  "height" 30
                                  "margin" "50px"
                                  }
          "onClick" (fn*() 
          (do
          (if (= (number (get-state "changedInput" ))  0) 
                       (do
                       (set-state "result" "input is zero")
                       )
          )
           (set-state "outputOne"  (number (get-state "changedInput" ))         )
          )
          )
        }"button")>
  ```
  
  6.Example:Celsius to Fahrenheit(There is  a problem ,the result is wrong)
  ```
  ::Text[celsius value:  @v]{label="outputOne"}
::Text[result:  @v]{label="result"}
<inputtry: (react-input {
                         "placeholder" "Enter the Celsuis Value " 
                         "onChange" (fn*(val) (do
                         (set-state "changedInput" val)
                         ))
})
>
<buttontry:(react-button{ "style"{
                                  "margin" "50px"
                                  }
          "onClick" (fn*()
          (do
                 (set-state "result"   (+ (* (number (get-state "changedInput")) 1.8) 32)       )
                 (set-state "outputOne"  (get-state "changedInput") )  
          )
          )
        }"convert")>
        
  ````
  7.The same above function but using println(console logging) and variables
  
  ```
  ::Text[celsius value:  @v]{label="celsius"}
::Text[result:  @v]{label="result"}
<inputtry: (react-input {
                         "placeholder" "Enter the Celsuis Value " 
                         "onChange" (fn*(val) (do
                         (set-state "changedInput" val)
                         ))
})
>
<buttontry:(react-button{ "style"{
                                  "margin" "50px"
                                  }
          "onClick" (fn*()  
          (let*(
               celsius (number(get-state "changedInput"))
               frah ( +(* celsius 1.8 ) 32)
          )
          (do
                 (set-state "celsius"  (get-state "changedInput") )  
                 (println  celsius "degree celsius is equal to" frah "degree fahrenheit."  )
          )
          )
          )
        }"convert")>
        
      

  
         

  ````
 8.Calculating square root using sqrt funtion
 ```
 ::Text[inputNumber:  @v]{label="input"}
::Text[result:  @v]{label="result"}
<inputtry: (react-input {
                         "placeholder" "Enter the Value " 
                         "onChange" (fn*(val) (do
                         (set-state "changedInput" val)
                         ))
})
>
<console: (
(def! sqrt (fn* (num) 
     (do
      (println(* num num ))
      (set-state "result" (* num num))
   ))  )
)>
<buttontry:(react-button{ "style"{
                                  "margin" "50px"
                                  }
          "onClick" (fn*()  
          (let*(
                   val  ( number(get-state "changedInput") )
          )
          (do
                 (set-state "input"  (get-state "changedInput") )  
                 (sqrt val )
          )
          ))
        }"convert")>
 ```
 
