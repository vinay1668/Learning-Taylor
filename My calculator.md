```
<Heading:(react-text {  "style" {
                                              "margin" 0
                                              "marginTop" "0px"
                                              "color" "#283149"
                                               "fontWeight" "bold"
                                               "fontSize" "50px"
                                               "fontFamily" "cursive"
                                               "textAlign" "center"
                                                  }} "My calculator")>
                                                  

<globalstyles:(set-style {
"MarkdownPreview" {
   "background" "white"
   "background-image" "url('https://ak.picdn.net/shutterstock/videos/1039937252/thumb/1.jpg ')"
   "background-position" "center"
   "background-repeat" "no-repeat"
   "background-size" "cover"
   }})>
   
 <initialColor:( (fn* () (do 
         (set-state "input" "")
         (set-state "operation" nil)
         (set-state "inputVal1" "")
         (set-state "inputVal2" "")
         (set-state "output" nil)
       )
       )
)>

<console: (
(def! calc (fn* (value) 
(do
            (if (= value "Clear")
            (do
            (set-state "input" "")
            (set-state "operation" nil)
            (set-state "inputVal1" "")
            (set-state "inputVal2" "")
            (set-state "output" "")
            )
            (if (or (= value "+")  (= value "-")  (= value "*" ) (= value "/")         ) 
               (do 
               (set-state "operation" value)
               (set-state "input" (str (get-state "input") value) )
               (println (get-state "operation"))
               )
               (if (= (get-state "operation") nil ) 
               (do
               (set-state "inputVal1" (str (get-state "inputVal1") value) )
               (println "val1 is" (get-state "inputVal1"))
               (set-state "input" (str (get-state "input") value) )
               )
                (do
               (set-state "inputVal2" (str (get-state "inputVal2") value) )
               (println "val2 is" (get-state "inputVal2"))
               (set-state "input" (str (get-state "input") value) )
               )
               )
            )
            ))



)  )
)>




   
   
   
   
   
   
   
   
   
   
   
   
   
   
   <inputBox1:(watch
["input"],
(fn* ()
(react-text  { 
               "style" {
                                "position" "relative"
                                "top" "120px"
                                 "width" 450
                                 "height" 50
                                 "margin" "20px"
                                 "marginLeft" "10px"
                                  "backgroundColor" "#DDDDDD"
                                  "borderRadius" 10
                                  "color" "black"
                                  "fontFamily" "cursive"
                                  "padding" 10
                 }
                 "onChange" (fn* (des) (do
                 ))
                     
}(get-state "input")
 )) )>
 
 
  <inputBox2:(watch
["output"],
(fn* ()
(react-text  { 
               "style" {
                                "position" "relative"
                                "top" "50px"
                                "left" "500px"
                                 "width" 100
                                 "height" 50
                                 "margin" "20px"
                                 "marginLeft" "10px"
                                  "backgroundColor" "#DDDDDD"
                                  "borderRadius" 10
                                  "color" "black"
                                  "fontFamily" "cursive"
                                  "padding" 10
                 }
                 "onChange" (fn* (des) (do
                 ))
                     
}(get-state "output")
 )) )>

 
 
 
   <setstyle:(let* (
        colorDefault "blue"
        colorHover "#185ADB"
    )
    (set-style {
        "commonStyle" {
          "position" "relative"
           "top" "20px"
            "margin" "10px"
            "color" "white"
            "font-family" "cursive"
            "background-color" colorDefault
            "width" "100px"
            "height" "50px"
        }
        "commonStyle:hover" {
            "background-color" colorHover
        }
    })
)>
 
  <numberButtons4:(react-div {} (list (map
	(fn* (value) 
    	(react-button {
            "className" "commonStyle"
            "style" {
            "position" "relative"
            "top" "81px"
            "left" "500px"
            "margin" "0px"
            }
             "onClick" (fn* ()
             (do
             (if (= value "Ans")
             (do
                   (if (= (get-state "operation") "+") 
                       (set-state "output"     (+  (number (get-state "inputVal1"))  (number(get-state "inputVal2"))      )                 )
                    )
                    (if (= (get-state "operation") "-") 
                          (set-state "output"     (-  (number (get-state "inputVal1"))  (number(get-state "inputVal2"))      )                 )
                    )
                    (if (= (get-state "operation") "*") 
                          (set-state "output"     (*  (number (get-state "inputVal1"))  (number(get-state "inputVal2"))      )                 )
                    )
                     (if (= (get-state "operation") "/") 
                          (set-state "output"     (/  (number (get-state "inputVal1"))  (number(get-state "inputVal2"))      )                 )
                    )
             )
            )
             )
             )
      	} value)
    )
	["Ans" ]
)))>
   
   
   <numberButtons:(react-div {} (list (map
	(fn* (value) 
    	(react-button {
            "className" "commonStyle"
            "onClick" (fn* () (do
             (calc value)
            )
            ) 
      	} value)
    )
	[1 2 3  "+" ]
)))>



   <numberButtons1:(react-div {} (list (map
	(fn* (value) 
    	(react-button {
            "className" "commonStyle"
             "onClick" (fn* () (do
               (calc value)
             )
             )
      	} value)
    )
	[4 5 6 "-"]
)))>

   <numberButtons3:(react-div {} (list (map
	(fn* (value) 
    	(react-button {
            "className" "commonStyle"
               "onClick" (fn* () (do
               (calc value)
             )
             )
      	} value)
    )
	[7 8 9 "*" ]
)))>

   <numberButtons5:(react-div {} (list (map
	(fn* (value) 
    	(react-button {
            "className" "commonStyle"
            "onClick" (fn* () (do
             (calc value)
            )
            ) 
      	} value)
    )
	["0" "." "Clear" "/"]
)))>


  
```
