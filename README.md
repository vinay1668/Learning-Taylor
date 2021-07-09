# Learning-Taylor

## Basic functions
1.square root function (sqrt)
```
(def! sqrt (fn* (num)
      ( println (* num num) )
   )
)
```
2.Modulo operation function(mod)
```
(def! mod (fn* (a b) 
    (println     (- a (number(* b (number(/ a b)) ) ) ) )
  ))  
```
3.Getting absolute value of a variable (abs)
```
(def! abs (fn* (num)
      (if (< num 0)
         (println "The absolute value of a is " (* num -1))
         (println "The absolute value of a is " num)
        
      )
   ))
```
4.function to check if two number are equal or not.
```
(def! check (fn* (a b)
      (if (= a b)
            (println "The numbers are equal")
              (println "The numbers are not equal")  
)
   ))
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
 9. Example for modulo operation
 ```
 ::Text[inputNumber:  @v]{label="input"}
::Text[inputNumber1:  @v]{label="input1"}
::Text[result:  @v]{label="result"}
<inputtry: (react-input {
                        "placeholder" "Enter the Value " 
                        "onChange" (fn*(val) (do
                        (set-state "changedInput" val)
                        ))
})
>
<inputtry1: (react-input {
                        "placeholder" "Enter the Value " 
                        "onChange" (fn*(val) (do
                        (set-state "changedInput1" val)
                        ))
})
>
<console: (
(def! mod (fn* (a b) 
    (do
    (println     (- a (number(* b (number(/ a b)) ) ) ) )
     (set-state "result"   (- a (number(* b (number(/ a b)) ) ) )    )
  ))  )
)>
<buttontry:(react-button{ "style"{
                                 "margin" "50px"
                                 }
         "onClick" (fn*()  
         (let*(
                  val  ( number(get-state "changedInput") )
                  val1  ( number(get-state "changedInput1") )
         )
         (do
                (set-state "input"  (get-state "changedInput") )  
                (set-state "input1"  (get-state "changedInput1") )
                (mod val val1 )
         )
         ))
       }"convert")>
 ```
 
 10.Changing the background color of a button on Click.
 ```
 

<globalstyles:(set-style {
	"MarkdownPreview" {
    	"background" "white"
    }})>

<initialColor:(set-state "color" "green")>
<buttontry:(watch
	["color"],
    (fn* () 
    (react-button{ "style"{
                                "className" "btn btn-primary"
                                "width" 100 
                                "height" 40
                                "margin" "50px"
                                "fontFamily" "cursive"
                                "backgroundColor" (get-state "color")
                                }
        "onClick" (fn*() 
        (do
         (if (= (get-state "color") "yellow" ) 
             (set-state "color" "blue")
             (set-state "color" "yellow")
         )
        )
        )
      }"click me")
))>
               

 ```
 11.Changing the color of the button on hover
 
 ```
 

<globalstyles:(set-style {
"MarkdownPreview" {
    "background" "white"
    }})>

<initialColor:(set-state "color" "blue")>
<consoleLogging: (def! log (fn*()
      (println "worked")
   ))
>
<buttontry:(watch
["color"],
    (fn* () 
    (react-button{ "style"{
                                "className" "btn btn-primary"
                                "width" 100 
                                "height" 40
                                "margin" "50px"
                                "fontFamily" "cursive"
                                "backgroundColor" (get-state "color")
                                }
          "onMouseOver" (fn*() 
          (set-state "color" "#185ADB") 
          ) 
          "onMouseOut" (fn* () 
          (set-state "color" "blue")
          )
        "onClick" (fn*() 
        )
      }"click me")
))>
               

 ```
 
 12.Button toggling with the design
 
 ```
 

<initialColor:( (fn* () (do 
       (set-state "color" "blue")
       (set-state "color1" "blue")
       (set-state "message" "click the below button ....")
       )
       )
)>




<globalstyles:(set-style {
"MarkdownPreview" {
   "background" "white"
   }})>

<consoleLogging: (def! log (fn*()
     (println "worked")
  ))
>

<inputtry:(watch
["message"],
(fn* ()
(react-text  { "style" {
                                 "width" 400
                                 "height" 120
                                 "margin" "50px"
                                 "marginLeft" "150px"
                                  "backgroundColor" "#DDDDDD"
                                  "borderRadius" 10
                                  "color" "black"
                                  "fontFamily" "cursive"
                                  "padding" 10
}
                     
}
 (get-state "message"))) )>
 
<buttontry:(watch
["color1" "color"],
   (fn* () 
   (react-div {} (list 
   (react-button{ "style"{
                               "className" "btn btn-primary"
                               "width" 100 
                               "height" 40
                               "margin" "10px"
                               "marginLeft" "180px"
                               "fontFamily" "cursive"
                               "backgroundColor" (get-state "color")
                               }
         "onMouseOver" (fn*() 
         (set-state "color" "#185ADB") 
         ) 
         "onMouseOut" (fn* () 
         (set-state "color" "blue")
         )
       "onClick" (fn*() (do
          (println (get-state "message") )
          (set-state  "message"   "Hello world!! I am trying to learn Taylor.
Taylor is a lisp like functional language.With Taylor you can build amazing marks.It is very easy to implement stuff on top of Taylor." )
       ))
     }"click me")
     (react-button{ "style"{
                               "className" "btn btn-primary"
                               "width" 100 
                               "height" 40
                               "margin" "10px"
                               "marginLeft" "180px"
                               "fontFamily" "cursive"
                               "backgroundColor" (get-state "color1")
                               }
         "onMouseOver" (fn*() 
         (set-state "color1" "#185ADB") 
         ) 
         "onMouseOut" (fn* () 
         (set-state "color1" "blue")
         )
       "onClick" (fn*() (do
          (println (get-state "message") )
          (set-state  "message"   "click the below button ..." )
       ))
     }"reset")
     
     
     
     
))))>



 ```
 
 
 
 
 
 
 
 
 
 
 
