

### Diary Mark
```






<initialColor:( (fn* () (do 
       (set-state "colorChange" "blue")
       (set-state "getColorChange" "yellow")
       (set-state "fileProof" nil)
       (set-state "fileProofVideo" nil)
       (set-state "description" nil)  
       (set-state "dateVal" nil)
       (set-state "setDescription" nil)
       (set-state "imgHash" nil)
       (set-state "videoHash" nil)
       (set-state "color2" "blue")
       (set-state "color3" "blue")
       (set-state "color4" "blue")
       (set-state "color5" "blue") 
       (set-state "getByDate" nil)
       )
       )
)>
<Heading:(react-text {  "style" {
                                              "margin" 0
                                              "marginTop" "0px"
                                              "color" "#283149"
                                               "fontWeight" "bold"
                                               "fontSize" "70px"
                                               "fontFamily" "cursive"
                                               "textAlign" "center"
                                                  }} "Diary Daap")>
                                                  


<uniqueid1:(react-text {  "style" {
                                              "margin" 0
                                              "marginTop" "0px"
                                              "color" "black"
                                               "fontFamily" "cursive"
                                               "fontSize" "30px"
                                                  }} "Date: ")>
                                                  
                                                  


<Date:(watch
["colorChange"],
(fn* ()
(react-input {"type" "date"
                       "style" {
                        "margin" "20px"
                        "color" "white"
                        "fontFamily" "cursive"
                        "backgroundColor" (get-state "colorChange")
                        "width" "500px"
                        "height" "40px"
                        "fontSize" "20px"
                       }
          "onMouseOver" (fn*()
         (set-state "colorChange" "#185ADB") 
         ) 
         "onMouseOut" (fn* () 
         (set-state "colorChange" "blue")
         )
         "onChange" (fn* (content) (do
           (set-state "dateVal" content)
           (set-state "getByDate" content)
          )
         )
                  }
)))>

<getData:(watch
["getColorChange"],
(fn* ()
(react-button {
                             "style" { 
                                       "backgroundColor" (get-state "getColorChange")
                                       "marginLeft" "200px"
                                       "color" "black"
                                       "fontFamily" "cursive"
                                       "fontWeight" "bold"
                                       "height" "50px"
                                       "width"  "100px"
                             } 
             "onMouseOver" (fn*()
         (set-state "getColorChange" "#FFF600") 
         ) 
         "onMouseOut" (fn* () 
         (set-state "getColorChange" "yellow")
         ) 
         "onClick" (fn* ()
           (println (get (get-state "fileIpfsHash") "path"))
         )
                                  }"Get Data")
))>                                     
                                         

<globalstyles:(set-style {
"MarkdownPreview" {
   "background" "white"
   "background-image" "url('https://ak.picdn.net/shutterstock/videos/1039937252/thumb/1.jpg ')"
   "background-position" "center"
   "background-repeat" "no-repeat"
   "background-size" "cover"
   }})>

<consoleLogging: (def! log (fn*()
     (println "worked")
  ))
>

<uniqueid2:(react-text { "style" {
                                              "margin" "0px"
                                              "marginTop" "10px"
                                              "color" "black"
                                               "fontFamily" "cursive"
                                               "fontSize" "30px"
                                                  }} "How is your day? : ")>
<inputtry:(watch
[],
(fn* ()
(react-textarea  { "placeholder" "Dear Diary ....."
               "style" {
                                 "width" 500
                                 "height" 140
                                 "margin" "20px"
                                 "marginLeft" "10px"
                                  "backgroundColor" "#DDDDDD"
                                  "borderRadius" 10
                                  "color" "black"
                                  "fontFamily" "cursive"
                                  "padding" 10
                 }
                 "onChange" (fn* (des) (do
                       (set-state "setDescription" des)
                       (println des)
                 ))
                     
}
 )) )>
 






<setstyle:(let* (
        colorDefault "blue"
        colorHover "#185ADB"
    )
    (set-style {
        "commonStyle" {
            "color" "white"
            "font-family" "cursive"
            "background-color" colorDefault
        }
        "commonStyle:hover" {
            "background-color" colorHover
        }
        "fileInput" {
            "margin" "20px"
            "width" "250px" 
        }
        "fileInputBtn" {
            "margin" "20"
        }
        "linkStyle" {
              "color" "red"
        }
    })
)>
<uniqueid3:(react-text { "style" {
                                              "margin" "0px"
                                              "color" "black"
                                               "fontFamily" "cursive"
                                               "fontSize" "30px"
                                                  }} "Choose Image : ")>
<uniqueid45:(watch 
["color2" "color3"],
(fn* ()
(react-div {} (list (    
react-button { "style" { 
                 "margin" "20"
                  "color" "white"
                  "fontSize" "20px"
                  "width" 100
                  "height" "40px"
                  "fontFamily" "cursive"
                  "backgroundColor" ( get-state "color2")
        }
          "onMouseOver" (fn*() 
         (set-state "color2" "#185ADB") 
         ) 
         "onMouseOut" (fn* () 
         (set-state "color2" "blue")
         )      
      "onClick" (fn* () ( do 
    (set-state 
        "fileIpfsHash" 
            (ipfs-set-file (get-state "fileProof"))
        )
        (set-state "imgHash" (get (get-state "fileIpfsHash") "path"))
        )
    )
} "submit")   
(react-input {"type" "file"
                       "placeholder" "choose files ....."
                       "style" {
                        "margin" "20px"
                        "color" "white"
                        "fontFamily" "cursive"
                        "backgroundColor" (get-state "color3")
                        "width" "400px" 
                  "fontSize" "20px"
                  "height" "40px"
                       }
        "onChange" (fn* (files) ( do 
            (log files "--files")
            (set-state  "fileProof" files)
        ))
          "onMouseOver" (fn*() 
         (set-state "color3" "#185ADB") 
         ) 
         "onMouseOut" (fn* () 
         (set-state "color3" "blue")
         )
                  })
)    ) ) ) )>        


<imgHash:(watch 
["fileIpfsHash"],
(fn* ()
(react-text { "style" { 
                                               "color" "blue"
                                               "fontFamily" "cursive"
                                               "fontSize" 20
                                               "fontWeight" "bold"
}
} (get (get-state "fileIpfsHash") "path")) ) )>






<uniqueid4:(react-text { "style" {
                                              "margin" "0px"
                                              "color" "black"
                                               "fontFamily" "cursive"
                                               "fontSize" "30px"
                                                  }} "Choose Video: ")>
<uniqueid46:(watch 
["color4" "color5"],
(fn* ()
(react-div {} (list (    
react-button { "style" { 
                 "margin" "20"
                  "color" "white"
                  "fontFamily" "cursive"
                  "backgroundColor" ( get-state "color4")
                                    "fontSize" "20px"
                  "width" 100
                  "height" "40px"
        }
          "onMouseOver" (fn*() 
         (set-state "color4" "#185ADB") 
         ) 
         "onMouseOut" (fn* () 
         (set-state "color4" "blue")
         )      
      "onClick" (fn* () ( do 
    (set-state 
        "fileIpfsHashVideo" 
            (ipfs-set-file (get-state "fileProofVideo"))
        )
        (set-state "videoHash" (get (get-state "fileIpfsHashVideo") "path"))
        )
    )
} "submit")   
(react-input {"type" "file"
                       "placeholder" "choose files ....."
                       "style" {
                        "margin" "20px"
                        "color" "white"
                        "fontFamily" "cursive"
                        "backgroundColor" (get-state "color5")
                   "width" "400px" 
                  "fontSize" "20px"
                  "height" "40px"
                       }
        "onChange" (fn* (files) ( do 
            (log files "--files")
            (set-state  "fileProofVideo" files)
        ))
          "onMouseOver" (fn*() 
         (set-state "color5" "#185ADB") 
         ) 
         "onMouseOut" (fn* () 
         (set-state "color5" "blue")
         )
                  })
)    ) ) ) )>        

<videoHash:(watch 
["fileIpfsHashVideo"],
(fn* ()
(react-text { "style" { 
                                               "color" "blue"
                                               "fontFamily" "cursive"
                                               "fontSize" 20
                                               "fontWeight" "bold"
}
} (get (get-state "fileIpfsHashVideo") "path")) ) )>

::Contract[]{name="Diary" function="addToday" input="dateVal,setDescription,imgHash,videoHash"}

::Contract[]{name="Diary" function="getDetialsByDate" input="getByDate" output="result"}

::Text[Result: @v]{label="result"}














                                                  
























                                                  












```














                                                  











