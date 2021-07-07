# Learning-Taylor

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
                    
                 
 
