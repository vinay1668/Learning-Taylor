### Marks Factory Tutorial v1 (done additional styling)

```

<globalstyles:(set-style {
"MarkdownPreview" {
   "background" "white"
   "background-image" "url('https://c4.wallpaperflare.com/wallpaper/304/196/925/yellow-green-pastel-blur-wallpaper-preview.jpg')"
   "background-position" "center"
   "background-repeat" "no-repeat"
   "background-size" "cover"
   "color" "black"
   "font-weight" "bold"
   "font-family" "cursive"
   "font-size" "20px"
   }})>
   
   <setstyle:
    (set-style {
           "subHeading" {
                            "font-size" "30px"
                            "font-weight" "bold"
                             "color" "blue"
                            "font-family" "cursive"
                            "margin-left" "0px"
        }
        "commonStyle" {
            "color" "black"
            "font-weight" "bold"
            "font-size" "20px"
            "font-family" "cursive"
            "margin-left" "20px"
        }
        "uncommonStyle" {
             "color" "black"
            "font-weight" "bold"
            "font-size" "25px"
            "font-family" "cursive"
            "margin-left" "20px"
        }
        "iconStyle" {
            "margin-left" "20px"
        }
    }
)>


<Heading:(react-text { "style" {
                                 "textAlign" "center"
                                 "fontSize" "50px"
                                 "fontWeight" "bold"
                                 "fontFamily" "cursive"
                                 "color" "black"
}
} "Marks Factory Tutorial v1")>



::Text[Intro]{class="subHeading"}

- ::Text[This is the Marks Factory. v1 means version 1.]{class="commonStyle"}
- ::Text[Marks Factory is a dApp (decentralized app) player and an IDE (Integrated development environment) for dApps.]{class="commonStyle"}
- ::Text[Marks are markdown apps with access to decentralized web tools. This tutorial is a mark. ]{class="commonStyle"}



::Text[Known Issues]{class="subHeading"}
- ::Text[Connecting to the IPFS network and loading marks is sometimes slow: refresh the page.]{class="commonStyle"}


::Text[Top Toolbar]{class="subHeading"}


- :Button[more]{icon=true class="iconStyle"} :Span[Load a recommended mark]{class ="commonStyle"}
- :Button[edit]{icon=true class="iconStyle"} :Span[Enter "edit" mode.]{class="commonStyle"}
- :Button[play]{icon=true class="iconStyle"} :Span[Enter "play" mode. This is how your mark is presented to the user.]{class="commonStyle"}
- :Button[export]{icon=true class="iconStyle"} :Span[Export your mark to IPFS. If your mark uses contract ABIs and addresses from your workspace, they will also be exported. You will see a QRcode image and if you click on it, the URL will be copied to the clipboard.You can preset form inputs by filling them in and then exporting.]{class="commonStyle"}
- :Button[eth]{icon=true class="iconStyle"} :Span[Load a contract function form, from the ABIs and addresses saved in the workspace.]{class="commonStyle"}
- :Button[component]{icon=true class="iconStyle"} :Span[Load a user interface component or command.]{class="commonStyle"}
- :Button[bold]{icon=true class="iconStyle"} - :Button[deindent]{icon=true class="iconStyle"} :Span[markdown syntax helpers. See]{class="commonStyle"} :Link[mastering markdown]{src="https://guides.github.com/features/mastering-markdown/" class="commonStyle"} 


::Text[Bottom Workspace]{class="subHeading"}
::Text[Add contract ABI & address information by:]{class="uncommonStyle"}
- :Span[Clicking on the bottom left]{class="commonStyle"} :Button[more]{icon=true} :Span[ -> Add item -> filling the form; if you fill in an IPFS hash from a contract saved in the Solidity compiler format, the abi will be loaded automatically -> click on the bottom right]{class="commonStyle"} :Button[^]{}

- :Span[Pasting JSON data in the bottom text area  of the form]{class="commonStyle"}


```

        [{
            "ipfs": "QmP5rC8m7DsZwmRjFr7PESKe9e9o7p7VVNP62jdBbiCGbQ",
            "name": "WETH",
            "address": "0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2",
            "abi": []
        }]
```


::Text[Add your mark to the menu recommendations]{class="subHeading"}
 - :Span[Make a Pull Request to]{class="commonStyle"} :Link[github.com/loredanacirstea]{src="https://github.com/loredanacirstea/recommendations/blob/main/marks/mainMenu.json" class="commonStyle"} :Span[and add your own mark under an existing category or propose a new category.]{class="commonStyle"}


::Text[Requirements]{class="subHeading"}
- ::Text[Your mark will have the GNU General Public License v3.0 license.]{class="commonStyle"}
- :Span[Mark title has the form: < TITLE > v < VERSION > e.g. "Mark Title v1".]{class="commonStyle"}
- ::Text[Mark contains a video tutorial of how to use the mark.]{class="commonStyle"}
- :Span[Add a : Link[created by 0x<ETH_ADDRESS>]{src=<DONATION_MARK>} at the bottom of your mark, for eventual donations, directing to the Payment mark preset with your data (example at the bottom of this mark). Fill in your data in]{class="commonStyle"} :Link[Payment Request]{src="/?ipfs=QmfFPi6EutBU2kdQExT57qV4aWtRx7KyrXnVnvQBuEme6k" class="commonStyle"} :Span[and export, to get the link]{class="commonStyle"}
- :Text[The mark's "label" is the same as its title.]{class="commonStyle"}
- :Text[Export your mark to IPFS first and use the 46 character hash as the mark's value id (e.g. QmadhiGumnFNeHf8pJge6A2sdunVNXH6VnLuFFvzsAbieC)]{class="commonStyle"}

::Text[Info]{class="subHeading"}

- ::Text[If your mark has been approved, updating the mark to a new version will be prioritized. E.g. if others, at a later date will propose a mark with the same functionality, it will not be approved unless exceedingly better.]{class="commonStyle"}

- ::Text[If a similar mark already exists, make a PR only if your mark brings significant improvements.]{class="commonStyle"}

::Text[Resources]{class="subHeading"}

- :Span[Marks Factory playlist]{class="commonStyle"} :Link[youtube.com/playlist]{src=" https://www.youtube.com/playlist?list=PL323JufuD9JBUwKSPILGKBaI5JPyAVapn" class="commonStyle"}


:::center

::Video[]{src="https://www.youtube.com/embed/6QkiuUSg7L8" width="560" height="315"}

::Text[The following is the link for supporting/promoting both Marks Factory and this tutorial:]{class="commonStyle"}

- :Link[created by 0x833D4c383Bef3163d447F90DA78f97379bDcC04d]{src="/?ipfs=QmfFPi6EutBU2kdQExT57qV4aWtRx7KyrXnVnvQBuEme6k&input=%7B%22amount_wei%22%3A%7B%22_hex%22%3A%220x071afd498d0000%22%2C%22_isBigNumber%22%3Atrue%7D%2C%22somethingnotexisting%22%3A%7B%22name%22%3A%22ropsten%22%2C%22chainId%22%3A3%2C%22ensAddress%22%3A%220x00000000000C2E074eC69A0dFb2997BA6C7d2e1e%22%7D%2C%22amount%22%3A%220.002%22%2C%22gasLimit%22%3A%2235000%22%2C%22gasPrice%22%3A%2215%22%2C%22receiver%22%3A%220x833D4c383Bef3163d447F90DA78f97379bDcC04d%22%2C%22reason%22%3A%22donation%20for%20creating%20a%20useful%20mark%22%7D" class="commonStyle"}

```



Unused code:

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

```
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

```



