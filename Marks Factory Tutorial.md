```

<globalstyles:(set-style {
"MarkdownPreview" {
   "background" "white"
   "background-image" "url('https://c4.wallpaperflare.com/wallpaper/304/196/925/yellow-green-pastel-blur-wallpaper-preview.jpg')"
   "background-position" "center"
   "background-repeat" "no-repeat"
   "background-size" "cover"
   }})>


<Heading:(react-text { "style" {
                                 "textAlign" "center"
                                 "fontSize" "50px"
                                 "fontWeight" "bold"
                                 "fontFamily" "cursive"
                                 "color" "black"
}
} "Marks Factory Tutorial v1")>



<Introduction:(react-text { "style" {
                            "fontSize" "30px"
                            "fontWeight" "bold"
                            "color" "blue"
                            "fontFamily" "cursive"
}
} "Intro")>

<IntroductionIn:(react-text { "style" {
                            "fontSize" "20px"
                            "fontWeight" "bold"
                            "color" "black"
                            "fontFamily" "cursive"
                            "marginLeft" "20px"
                            
}
} "1) This is the Marks Factory. v1 means version 1."
)>

<IntroductionIn2:(react-text { "style" {
                            "fontSize" "20px"
                            "fontWeight" "bold"
                            "color" "black"
                            "fontFamily" "cursive"
                            "marginLeft" "20px"
                            
}
} "2) Marks Factory is a dApp (decentralized app) player and an IDE (Integrated development environment) for      dApps. "
)>

<IntroductionIn3:(react-text { "style" {
                            "fontSize" "20px"
                            "fontWeight" "bold"
                            "color" "black"
                            "fontFamily" "cursive"
                            "marginLeft" "20px"
                            
}
} "3) Marks are markdown apps with access to decentralized web tools. This tutorial is a mark. "
)>

<Issues:(react-text { "style" {
                            "fontSize" "30px"
                            "fontWeight" "bold"
                            "color" "blue"
                            "fontFamily" "cursive"
}
} "Known Issues")>

<IssuesIn1:(react-text { "style" {
                            "fontSize" "20px"
                            "fontWeight" "bold"
                            "color" "black"
                            "fontFamily" "cursive"
                            "marginLeft" "20px"
                            
}
} "1) connecting to the IPFS network and loading marks is sometimes slow: refresh the page. "
)>

<TopToolBar:(react-text { "style" {
                            "fontSize" "30px"
                            "fontWeight" "bold"
                            "color" "blue"
                            "fontFamily" "cursive"
}
} "Top Toolbar")>




<tool1:(react-div {"style" {"display" "flex"} } (list 
      (react-button {"style" {"marginLeft" "20px"}} (react-icon-our {"title" "more" "width" "48px" }))
      (react-text { "style" {
                            "position" "relative"
                            "top" "10px"
                            "fontSize" "20px"
                            "fontWeight" "bold"
                            "color" "black"
                            "fontFamily" "cursive"
                            "marginLeft" "20px"                      
       }
        } "Load a recommended mark"
       )      
)  )>

<tool2:(react-div {"style" {"display" "flex" "marginTop" "10px" } } (list 
      (react-button {"style" {"marginLeft" "20px"}} (react-icon-our {"title" "edit" "width" "48px" }))
      (react-text { "style" {
                            "position" "relative"
                            "top" "10px"
                            "fontSize" "20px"
                            "fontWeight" "bold"
                            "color" "black"
                            "fontFamily" "cursive"
                            "marginLeft" "20px"                      
       }
        } "Enter 'edit' mode"
       )      
)  )>

<tool3:(react-div {"style" {"display" "flex" "flexGrow" "1" "marginTop" "10px" } } (list 
      (react-button {"style" {"marginLeft" "20px"}} (react-icon-our {"title" "play" "width" "48px" }))
      (react-text { "style" {
                            "position" "relative"
                            "top" "10px"
                            "fontSize" "20px"
                            "fontWeight" "bold"
                            "color" "black"
                            "fontFamily" "cursive"
                            "marginLeft" "20px"                      
       }
        } "Enter 'play' mode. This is how your mark is presented to the user."
       )      
)  )>


<tool4:(react-div {"style" {"display" "flex" "marginTop" "10px" } } (list 
      (react-button {"style" {"marginLeft" "20px"}} (react-icon-our {"title" "export" "width" "48px" }))
      (react-text { "style" {
                            "position" "relative"
                            "top" "10px"
                            "fontSize" "20px"
                            "fontWeight" "bold"
                            "color" "black"
                            "fontFamily" "cursive"
                            "marginLeft" "50px"                      
       }
        } "Export your mark to IPFS. If your mark uses contract ABIs and addresses from your workspace, they will also be exported. You will see a QRcode image and if you click on it, the URL will be copied to the clipboard. You can preset form inputs by filling them in and then exporting."
       )      
)  )>


<tool5:(react-div {"style" {"display" "flex" "marginTop" "10px" } } (list 
      (react-button {"style" {"marginLeft" "20px"}} (react-icon-our {"title" "eth" "width" "48px" }))
      (react-text { "style" {
                            "position" "relative"
                            "top" "10px"
                            "fontSize" "20px"
                            "fontWeight" "bold"
                            "color" "black"
                            "fontFamily" "cursive"
                            "marginLeft" "20px"                      
       }
        } "Load a contract function form, from the ABIs and addresses saved in the workspace."
       )      
)  )>

<tool6:(react-div {"style" {"display" "flex" "marginTop" "10px" } } (list 
      (react-button {"style" {"marginLeft" "20px"}} (react-icon-our {"title" "component" "width" "48px" }))
      (react-text { "style" {
                            "position" "relative"
                            "top" "10px"
                            "fontSize" "20px"
                            "fontWeight" "bold"
                            "color" "black"
                            "fontFamily" "cursive"
                            "marginLeft" "20px"                      
       }
        } "Load a user interface component or command"
       )      
)  )>

<tool7:(react-div {"style" {"display" "flex" "marginTop" "10px" } } (list 
      (react-button {"style" {"marginLeft" "20px"}} (react-icon-our {"title" "bold" "width" "48px" }))
      (react-button {"style" {"marginLeft" "20px"}} (react-icon-our {"title" "deindent" "width" "48px" }))
      (react-text { "style" {
                            "position" "relative"
                            "top" "10px"
                            "fontSize" "20px"
                            "fontWeight" "bold"
                            "color" "black"
                            "fontFamily" "cursive"
                            "marginLeft" "20px"                      
       }
        } "Markdown syntax helpers. see "
       )  
      (react-link { "style" {
                    "position" "relative"
                     "fontSize" "20px"
                     "color" "black"
                     "marginTop" "30px"
      }  "src" (str "https://guides.github.com/features/mastering-markdown/") } "https://guides.github.com/features/mastering-markdown/" )
)  )>





<setstyle:
    (set-style {
        "commonStyle" {
            "color" "black"
            "font-weight" "bold"
            "font-size" "20px"
            "font-family" "cursive"
        }
    }
)>

-:Button[more]{icon=true class="commonStyle"} :Text[dummy]{class="commonStyle"}























<addMarks:(react-text { "style" {
                            "fontSize" "30px"
                            "fontWeight" "bold"
                            "color" "blue"
                            "fontFamily" "cursive"
}
} "Add your mark to the menu recommendations")>

<marksIn1:(react-text { "style" {
                            "fontSize" "20px"
                            "fontWeight" "bold"
                            "color" "black"
                            "fontFamily" "cursive"
                            "marginLeft" "20px"
                            
}
} "Make a Pull Request to https://github.com/loredanacirstea/recommendations/blob/main/marks/mainMenu.json and add your own mark under an existing category or propose a new category."
)>








```




