```





<globalstyles:(set-style {
"MarkdownPreview" {
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
           "Heading" {
                                  "text-align" "center"
                                 "font-size" "50px"
                                 "font-weight" "bold"
                                 "font-family" "cursive"
                                 "color" "black"
                                 "margin" "0px"
           }
           "subHeading" {
                            "font-size" "25px"
                            "font-weight" "bold"
                             "color" "blue"
                            "font-family" "cursive"
                            "margin-left" "0px"
        }
        "commonStyle" {
            "color" "black"
            "font-weight" "bold"
            "font-size" "23px"
            "font-family" "cursive"
            "margin-left" "0px"
        }
        "commonStyle1" {
              	 "padding-left" "80px"
        }
        "commonStyle2" {
              	 "padding-left" "70px"
        }
         "commonStyle3" {
              	 "padding-left" "30px"
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
        "network" {
                                  "position" "realtive"
                                  "top" "0px"
                                   "text-align" "right"
                                   "font-size" "15px"
                                   "font-weight" "bold"
                                   "font-family" "cursive"
                                   "color" "black"
                                   "margin" "0px"
                                   "opacity" "0.3"
                                   "padding" "0px"
        }
        "react" {
             "color" "black"
        }
    }
)>


 

:Text[The Laurel v1]{class="Heading"} :Text[on Rinkeby]{class="network"} :Text[required chainId 4.Current chainId is @chainId]{command="eth-provider-getNetwork" class="network"}




<specialfn:(list
  (def! get-github-issues (fn* (volunteerRepo)
    (fetch-json (str "https://api.github.com/repos/" volunteerRepo "/issues"))
  ))
  (def! get-github-prs (fn* (volunteerRepo)
    (fetch-json (str "https://api.github.com/repos/" volunteerRepo "/issues"))
  ))
  (def! get-task-options (fn* (volunteerRepo taskNumber)
    (fetch-json (str "https://raw.githubusercontent.com/" volunteerRepo "/main/options/task" taskNumber ".json"))
  ))
)>

<initialState:(let* (
    volunteerRepo "the-laurel/laurels"
    dims (window-dimensions)
    widthfirst (if (gt (get dims "width") (get dims "height")) true false)
  )
  (do
    (set-state "widthfirst" widthfirst)
    (set-state "selectedTask" nil)
    (set-state "volunteerRepo" volunteerRepo)
  )
)>

<volunteersMap:(let* (
    volunteersMap (fetch-json "https://raw.githubusercontent.com/the-laurel/laurels/main/data/volunteersMap.json")
    volunteersData (map
      (fn* (key)
        {"label" (get volunteersMap key) "value" key}
      )
      (keys volunteersMap)
    )
    dsfsd (log volunteersMap "volunteersMap")
    dsfsd (log volunteersData "volunteersData")
  )
    (do
      (set-state "volunteersMap" (assoc volunteersMap (get-contract-address "TheLaurel") "TheLaurel"))
      (set-state "volunteersData" volunteersData)
    )
)>

<laurelsMap:(let* (
    laurelsMap (fetch-json "https://raw.githubusercontent.com/the-laurel/laurels/main/data/laurelsMap.json")
    laurelsData (map
      (fn* (key)
        {"label" (get laurelsMap key) "value" key}
      )
      (keys laurelsMap)
    )
  )
    (do
      (set-state "laurelsMap" laurelsMap)
      (set-state "laurelsData" laurelsData)
    )
)>

<GitHubIssues:(watch
  ["volunteerRepo"]
  (fn* () (let* (
      issues (get-github-issues (get-state "volunteerRepo"))
    )
    (set-state "githubIssues" issues)
  ))
  true
)>

<GitHubPRs:(watch
  ["volunteerRepo"]
  (fn* () (let* (
      prs (get-github-prs (get-state "volunteerRepo"))
    )
    (set-state "githubPRs" prs)
  ))
  true
)>

<GitHubIssuesMap:(watch
  ["githubIssues"]
  (fn* () (let* (
      issues (get-state "githubIssues")
      issueMap (reduce
        (fn* (accum issue) (let* (
            label (get issue "title")
            value (get issue "html_url")
            hash (eth-utils-solidityKeccak256 ["string"] [value])
          )
            (assoc accum hash {"value" value "label" label})
        ))
        issues
        {}
      )
    )
    (set-state "githubIssuesMap" issueMap)
  ))
  true
)>

<registrationEvents:(watch
  ["registrationReceipt"]
  (fn* ()
    (let* (
        events (eth-contract-events
          "TheLaurel"
          "RegisterTask"
          {}
        )
        events (if (sequential? events)
          (map
            (fn* (event) (get event "args"))
            events
          )
          []
        )
      )
      (do
        (if (gt (count events) 0) (set-state "selectedTask" (first (first events)) ) )
        (set-state "registrationEvents" events)
      )
    )
  )
)>

<volunteerRegistrationEvents:(watch
  ["registerVolunteerReceipt" "fromBlockLaurel" "claimAndAwardLaurelsReceipt" "pumpReceipt" "exchangeLaurelsReceipt"]
  (fn* ()
    (let* (
        events (eth-contract-events
          "TheLaurel"
          "RegisterVolunteer"
          {}
        )
        events (if (sequential? events)
          (map
            (fn* (event)
              (let* (
                  args (get event "args")
                  ancestor (first args)
                  volunteer (nth args 1)
                  volunteerName (get volunteersMap volunteer)
                  ancestorName (get volunteersMap ancestor)
                )
                {
                  "volunteer" volunteer
                  "ancestor" ancestor
                  "volunteerName" (if (nil? volunteerName) "anonymous" volunteerName)
                  "ancestorName" (if (nil? ancestorName) "anonymous" ancestorName)
                }
              )
            )
            events
          )
          []
        )
        dsfsd (log events "events")
      )
      (set-state "volunteerEvents" events)
    )
))>

<instanceOptionsSelect:(watch
  ["registrationEvents" "githubIssuesMap" ]
  (fn* () (let* (
      githubIssuesMap (get-state "githubIssuesMap")
      githubIssuesMap (if (nil? githubIssuesMap) {} githubIssuesMap)
      selectOptions (map
        (fn* (val)
          (let* (
            taskid (first val)
            value (get githubIssuesMap taskid)
            value (if (nil? value) taskid (get value "label"))
          )
            {"label" value "value" taskid}
          )
        )
        (get-state "registrationEvents")
      )
    )
    (react-div {"style" {"display" "flex"}} (list
      (react-text {"key" 1 "value" "Choose Task:   " "style" {
                              											"paddingRight" "15px"
                                                                        "color" "blue"
                                                                        "fontFamily" "cursive"
                                                                        "fontSize" "25px"
                                                                        "marginTop" "30px"
                                                                        }
                                                                        }
                                                                        )
      (react-select { "style" {
                             "height" "30px"
                              "backgroundColor" "grey"
                              "color" "black"
                              "fontFamily" "cursive"
                              "fontSize" "20px"
                              "fontWeight" "bold"
                              "marginTop" "30px"
                              }
        "key" 2
        "options" selectOptions
        "onChange" (fn* (val) (set-state "selectedTask" val))
      })
    ))
  ))
  true
)>






<getTaskData:(watch
  ["selectedTask"]
  (fn* ()
    (react-div {} (list
      (react-Contract {
        "key" 1
        "name" "TheLaurel"
        "function" "getTask"
        "input" "selectedTask"
        "output" "instanceData"
        "showbtn" false
        "hidden" "output,input"
      })
      (react-Contract {
        "key" 2
        "name" "TheLaurel"
        "function" "decimals"
        "input" ""
        "output" "laurelDecimals"
        "showbtn" false
        "hidden" "output,input"
      })
    ))
  )
)>

<splitTaskData:(watch
  ["instanceData"]
  (fn* ()
    (let* (
        instanceData (get-state "instanceData")
      )
      (if (sequential? instanceData)
        (do
          (set-state "currentTask" (first instanceData))
          (set-state "currentOptionIds" (nth instanceData 1))
          (set-state "currentVotingOptions" [])
        )
        nil
      )
    )
  )
)>

<votingOptions:(watch
  ["currentOptionIds" "volunteersMap"]
  (fn* ()
    (let* (
        currentOptionIds (get-state "currentOptionIds")
        volunteersMap (get-state "volunteersMap")
        currentVotingOptions (map
          (fn* (val index) (let* (
              voption (react-Contract-call "TheLaurel" "getVotingOption" (get-state "selectedTask") index)
              beneficiary (first voption)
              volunteerName (get volunteersMap beneficiary)
              volunteerName (if (nil? volunteerName) "anonymous" volunteerName)
            )
            {
              "beneficiary" beneficiary
              "beneficiaryName" volunteerName
              "label" (str "option " index " - beneficiary: " volunteerName)
              "value" index
            }
          ))
          currentOptionIds
        )
      )
      (set-state "currentVotingOptions" currentVotingOptions)
    )
  )
  true
)>

<taskinfo:(watch
  ["currentTask", "laurelDecimals"]
  (fn* ()
    (let* (
        volunteersMap (get-state "volunteersMap")
        currentTask (get-state "currentTask")
        decimals (bn-toNumber (get-state "laurelDecimals"))
        selectedTask (get-state "selectedTask")
        taskurl (get githubIssuesMap selectedTask)
        taskurl (if (nil? taskurl) nil (get taskurl "value"))
      )
      (react-div {} (list
        (if (nil? taskurl)
       (react-div{"style" {"display" "flex"}} (list
          (react-text {"key" 0 "style" {
                                                   "color" "blue"
                                                                        "paddingRight" "15px"
                                                                        "color" "blue"
                                                                        "fontFamily" "cursive"
                                                                        "fontSize" "25px"
                                                                        "marginTop" "0px"
                                                                        "paddingRight" "110px"
                                        } } "Task: " ) 
                         (react-text {"key" 5 "style" {
                                                   "color" "black"
                                                                        "paddingRight" "15px"
                                                                        "color" "black"
                                                                        "fontFamily" "cursive"
                                                                        "fontSize" "23px"
                                                                        "marginTop" "0px"
                                                                        "fontWeight" "bold"
                                        } } (str  selectedTask) )               
                                        ) )                                     
          (react-link {"key" 1  "style" {
          										                          "color" "black"
                                                                        "paddingRight" "15px"
                                                                        "color" "black"
                                                                        "fontFamily" "cursive"
                                                                        "fontSize" "25px"
                                                                        "marginTop" "0px"
          }} taskurl)
        )
        (react-div{"style" {"display" "flex"}} (list
                  (react-text {"key" 6 "style" {
                                                   "color" "blue"
                                                                        "paddingRight" "15px"
                                                                        "color" "blue"
                                                                        "fontFamily" "cursive"
                                                                        "fontSize" "25px"
                                                                        "marginTop" "0px"
                                                                        "paddingRight" "50px"
                                        } } "Organizer: " ) 
        (react-text {"key" 2 "style" {
               							 "paddingRight" "15px"
                                                                        "color" "black"
                                                                        "fontFamily" "cursive"
                                                                        "fontSize" "23px"
                                                                        "marginTop" "0px"
        }} (str  (get volunteersMap (nth currentTask 0))) )  
        )
        )
        (react-div{"style" {"display" "flex"}} (list
        (react-text {"key" 6 "style" {
                                                   "color" "blue"
                                                                        "paddingRight" "15px"
                                                                        "color" "blue"
                                                                        "fontFamily" "cursive"
                                                                        "fontSize" "25px"
                                                                        "marginTop" "0px"
                                                                        "paddingRight" "80px"
                                        } } "Laurels: " ) 
                (react-text
          {"key" 3 "style" {
                                                                        "color" "black"
                                                                        "fontFamily" "cursive"
                                                                        "fontSize" "23px"
                                                                        "marginTop" "0px"
          }}
          (str
            (js-eval (str "(" (bn-toNumber (nth currentTask 2)) "/(10**" decimals ")).toFixed(" decimals ")"))
            " "
            (get laurelsMap (nth currentTask 1))
          )
        )                                
        ))
      ))
    )
  )
  true
)>

<onVotingReceipt:(watch
  ["votingReceipt"]
  (fn* ()
    (react-div {} (list
      (react-Contract {
        "key" 1
        "name" "TheLaurel"
        "function" "getVoteStatus"
        "input" "selectedTask"
        "output" "voteStatus"
        "showbtn" false
        "hidden" "output,input"
      })
      (react-Contract {
        "key" 2
        "name" "TheLaurel"
        "function" "winners"
        "input" "selectedTask"
        "output" "voteWinner"
        "showbtn" false
        "hidden" "output,input"
      })
    ))
  )
)>


::br[]{}
::br[]{}
:Span[Winner:]{class="subHeading"} :Span[@v]{label=voteWinner class="commonStyle commonStyle1"}
:Span[option @[1]:]{class="subHeading" label=voteStatus} :Span[@[3] vote weight]{label=voteStatus class="commonStyle commonStyle2"}
:Span[option @[2]:]{class="subHeading" label=voteStatus} :Span[@[4] vote weight]{label=voteStatus class="commonStyle commonStyle2"}
:Span[vote status: ]{label=voteStatus class="subHeading"} :Span[ @[0] ]{label=voteStatus class="commonStyle commonStyle3"}



::br[]{}
::br[]{}
::Span[Vote Status:]{class="subHeading"}
* 1: :Span[option @[1] wins]{label=voteStatus}
* 2: :Span[option @[2] wins]{label=voteStatus}
* 3: undecidable, leaning towards :Span[@[1]]{label=voteStatus}
* 4: undecidable, leaning towards :Span[@[2]]{label=voteStatus}

::br[]{}
::br[]{}

<votingEvents:(watch
  ["selectedTask" "votingReceipt"]
  (fn* ()
    (set-state "votingEvents" (eth-contract-events
      "TheLaurel"
      "Voted"
      {"taskid" (get-state "selectedTask")}
    ))
  )
)>

<smthggggg:(watch
  ["votingEvents", "laurelDecimals"]
  (fn* ()
    (let* (
        votingEvents (get-state "votingEvents")
        decimals (bn-toNumber (get-state "laurelDecimals"))
        data (map
          (fn* (val)
            (let* (
                args (get val "args")
                optionIndex (bn-toNumber (nth args 1))
                weight (bn-toNumber (nth args 4))
              )
              {
                "weight" weight
                "optionIndex" optionIndex
              }
            )
          )
          votingEvents
        )
      )
      (set-state "graphData" (graphs-fn-accumulate data decimals))
    )
  )
  true
)>

::Span[Vote]{class="subHeading"}
:br[]{}

<displayGraph:(watch ["widthfirst"] (fn* ()
(react-div {"style" (if (get-state "widthfirst") {"display" "flex"} {}) } (list
  (watch
    ["graphData" "selectedOptions" "currentOptionIds"]
    (fn* ()
      (let* (
          currentOptionIds (get-state "currentOptionIds")
          votingOptions (map
            (fn* (val index) {"label" (str "option " index) "value" index})
            currentOptionIds
          )
          selectedOptions (get-state "selectedOptions")
          graphData (get-state "graphData")
          graphData (if (nil? graphData) [] graphData)
          ratioX (nth currentTask 3)
          ratioY (nth currentTask 4)

          componentDidMount (fn* (props state stateChangers)
            (graphs-voting-continuous {
              "id" "votingGraph"
              "data" graphData
              "axes" selectedOptions
              "axesLabels" [
                (str "opt " (nth selectedOptions 0))
                (str "opt " (nth selectedOptions 1))
              ]
              "ratio" {"x" (bn-toNumber ratioX) "y" (bn-toNumber ratioY)}
            })
          )

          render (fn* (props state stateChangers)
            (react-div {} (list
              (react-div {"key" 1 "style" {"display" "flex"}} (list
                (react-select { "style" {
                     									"backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                                                  }
                  "key" 11
                  "options" votingOptions
                  "value" (nth (get-state "selectedOptions") 0)
                  "onChange" (fn* (val) (set-state
                    "selectedOptions"
                    [(number val) (nth (get-state "selectedOptions") 1)]
                  ))
                })
                (react-select { "style" {
                               						   "backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                }
                  "key" 12
                  "options" votingOptions
                  "value" (nth (get-state "selectedOptions") 1)
                  "onChange" (fn* (val) (set-state
                    "selectedOptions"
                    [(nth (get-state "selectedOptions") 0) (number val)]
                  ))
                })
              ))
              (react-div {"key" 2 "id" "votingGraph"})
            ))
          )
        )
        (react {} {} {"render" render "componentDidMount" componentDidMount})
      )
    )
    true
  )
  (react-div {} (list
    (react-div {"key" 1} (list
      (react-text {"key" 11 "style" {"color" "blue" "fontSize" "25px" "fontFamily" "cursive"}} "Vote")
      (react-div {"key" 12} (list
        (watch
          ["currentVotingOptions"]
          (fn* () (let* (
              options (get-state "currentVotingOptions")
              initstate (set-state "selectedOption" 0)
            )
            (react-select { "style" {
            								             "backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                                                        "marginBottom" "10px"
            }
              "key" 122
              "options" options
              "onChange" (fn* (val)
                (set-state "selectedOption" (number val))
              )
            })
          ))
          true
        )
        (react-input {
          "key" 13
          "placeholder" "amount: number"
          "style" {
          										         "backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                                                }
          "onChange" (fn* (val) (set-state "voteAmount" val))
        })
        (react-Contract { "style" {
                                    "color" "blue"
        }
          "key" 14
          "name" "TheLaurel"
          "function" "awardLaurels"
          "input" "selectedTask,selectedOption,voteAmount"
          "output" "votingReceipt"
          "hidden" "input"
        })
      ))
    ))
    (react-div {"key" 2 "style" {"marginTop" "20px" "marginBottom" "20px" "borderBottom" "1px double"}})
    (watch
      ["currentTask" "volunteersData" "githubPRs"]
      (fn* ()
        (let* (
            prs (concat [{"value" nil "label" ""}] (map
              (fn* (val index)
                {"value" (get val "html_url") "label" (get val "title")}
              )
              githubPRs
            ) )
            optionid (fn* (val) (eth-utils-solidityKeccak256 ["string"] [val]))
            claimAmountDefault (bn-toNumber (nth (get-state "currentTask") 2))
            setinistate (list
              (set-state "claimBeneficiary" (get (nth volunteersData 0) "value"))
              (set-state "claimOptionId" nil)
              (set-state "claimAmount" claimAmountDefault)
            )
          )
          (react-div {"key" 3} (list
            (react-text {"key" 31 "style" {"fontSize" "25px" "color" "blue" "fontFamily" "cursive"}} "Claim Task")
            (react-div {"key" 32} (list
              (react-span {"key" 1  "style" {"fontSize" "18px" "color" "blue" "fontFamily" "cursive"} } "Beneficiary: ")
              (react-select { "style" {
              								           "backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                                                        "marginLeft" "50px"
              }
                "key" (str 2 (get-state "selectedTask"))
                "defaultValue" (get-state "claimBeneficiary")
                "options" volunteersData
                "onChange" (fn* (val)
                  (set-state "claimBeneficiary" val)
                )
              })
            ))
            (react-div {"key" 33 "style" {"marginTop" "20px"}} (list
              (react-span {"key" 331 "style" {
             	 			"color" "blue" 
            	 			 "fontSize" "18px"
             				 "fontFamily" "cursive" 
              }} "Select proof: ")
              (react-select { "style" {
                 										"width" "700px"
              											  "backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                                                        "marginLeft" "35px"
              }
                "key" (str 332 (get-state "selectedTask"))
                "options" prs
                "onChange" (fn* (val)
                  (set-state "claimOptionId" (if (nil? val) nil (optionid val)))
                )
              })       
            ))          
            (react-div {"style" {"marginTop" "20px"}} (list
                      (react-span {"key" 333 "style" {
                      "color" "blue" 
                      "fontSize" "18px" 
                      "fontFamily" "cursive"
                      } }  "(or) url ")
              (react-input { "style" {
              						                 		"width" "700px"
              											  "backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                                                         "marginLeft" "90px"
              }
                "key" (str 334 (get-state "selectedTask"))
                "placeholder" "url"
                "onChange" (fn* (val)
                  (set-state "claimOptionId" (if (nil? val) nil (optionid val)))
                )
              })
              ))    
            (react-div {"key" 34 "style" {"marginTop" "20px" "marginBottom" "10px"}  } (list
              (react-span {"key" 341 "style" {"fontSize" "18px" "fontFamily" "cursive" "color" "blue"} } "Amount: ")
              (react-input { "style" {
              							              		"width" "400px"
              											  "backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                                                         "marginLeft" "80px"
              }
                "key" (str 342 claimAmountDefault)
                "defaultValue" claimAmountDefault
                "placeholder" "amount: number"
                "onChange" (fn* (val)
                  (set-state "claimAmount" val)
                )
              })
            ))
          ))
        )
      )
      true
    )
    (react-Contract {
      "key" 4
      "name" "TheLaurel"
      "function" "claimAndAwardLaurels"
      "input" "selectedTask,claimOptionId,claimBeneficiary,claimAmount"
      "output" "claimAndAwardLaurelsReceipt"
      "hidden" "input"
    })
  ))
))
))>

<setRelevantSelectedOptions:(watch
  ["voteStatus"]
  (fn* ()
    (if (sequential? voteStatus)
      (set-state "selectedOptions" [(bn-toNumber (nth voteStatus 1)) (bn-toNumber (nth voteStatus 2))])
      nil
    )
  )
  true
)>


* circles - momentary voting outcome (x,y)
* the white vote line - dynamic change of the votes
* the grey lines are thresholds for different events

::br[]{}
::br[]{}


<volunteerBalances:(watch
  ["volunteerEvents" "laurelDecimals" "laurelsMap"]
  (fn* ()
    (let* (
        laurelsMap (get-state "laurelsMap")
        laurelsData (get-state "laurelsData")
        decimals (bn-toNumber (get-state "laurelDecimals"))
        volunteerEvents (get-state "volunteerEvents")
        balances (map
          (fn* (volunteer)
            (let* (
                addr (get volunteer "volunteer")
                balances (map
                  (fn* (laurel)
                    (let* (
                        laurelid (get laurel "value")
                        bal (react-Contract-call "TheLaurel" "getBalance" addr laurelid)
                        pbal (react-Contract-call "TheLaurel" "getPrimordialBalance" addr laurelid)

                        balstr (js-eval (str "(" (bn-toNumber bal) "/(10**" decimals ")).toFixed(" decimals ")"))
                        pbalstr (js-eval (str "(" (bn-toNumber pbal) "/(10**" decimals ")).toFixed(" decimals ")"))
                      )
                      (if (and (= bal 0) (= pbal 0))
                        nil
                        (assoc
                          volunteer
                          "laurelid" laurelid
                          "laurel" (get laurelsMap laurelid)
                          "balance" balstr
                          "pbalance" pbalstr
                        )
                      )
                    )
                  )
                  laurelsData
                )
                balances (filter
                  (fn* (v) (if (nil? v) false true))
                  balances
                )
              )
              balances
            )
          )
          volunteerEvents
        )
        balances (reduce
          (fn* (accum val)
            (concat accum val)
          )
          balances
          []
        )
      )
      (set-state "volunteerBalances" balances)
    )
  )
  true
)>

<balancesTable:(watch
  ["volunteerBalances"]
  (fn* ()
    (let* (
        balances (get-state "volunteerBalances")
        emptyDataConfig {"emptyText" "-"}
        balanceColumns [
          {
            "title" "volunteer"
            "dataIndex" "volunteerName"
            "key" "volunteer"
          }
          {
            "title" "ancestor"
            "dataIndex" "ancestorName"
            "key" "ancestor"
          }
          {
            "title" "laurel"
            "dataIndex" "laurel"
            "key" "laurelid"
          }
          {
            "title" "B"
            "dataIndex" "balance"
            "key" "balance"
          }
          {
            "title" "PB"
            "dataIndex" "pbalance"
            "key" "pbalance"
          }
        ]
      )
      (react-div {"style" {
      							"fontFamily" "cursive"
                                "color" "blue"
                                "backgroundColor" "blue"
      }} (list
        (react-table { "style" {
        						"fontFamily" "cursive"
                                "color" "blue"
                                "backgroundColor" "blue"	
        }
          "key" 1
          "locale" emptyDataConfig
          "columns" balanceColumns
          "data" balances
          "size" "small"
          "pagination" { "pageSize" (count balances) "position" ["none" "none"] }
        })
      ))
    )
  )
  true
)>



::br[]{}
::br[]{}





::a[]{id="pumpBalance"}

::Text[Pump!]{class="subHeading"}

<pumpLaurelId:(watch
  ["laurelsData"]
  (fn* ()
    (do-and-render
      (list
        (set-state "pumpLaurelId" (get (nth (get-state "laurelsData") 0) "value"))
      )
      (react-div {} (list
        (react-text {"key" 1 "style" {
        								"fontSize" "23px"
                                        "fontFamily" "cursive"
                                        "color" "black"
        }
        } "Transfer your primordial, inactive balance to your current balance, in order to use it and reward your ancestor!")
        (react-select { "style" {
        					            								             "backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                                                        "marginBottom" "10px"
        }
          "key" 2
          "options" (get-state "laurelsData")
          "onChange" (fn* (val)
            (set-state "pumpLaurelId" val)
          )
        })
        (react-Contract {
          "key" 3
          "name" "TheLaurel"
          "function" "pump"
          "input" "pumpLaurelId"
          "output" "pumpReceipt"
          "hidden" "input"
        })
      ))
    )
  )
  true
)>


::br[]{}
::br[]{}


::a[]{id="exchangeLaurels"}

::Text[Exchange Laurels]{class="subHeading"}
<selectLaurelsForExchange:(watch
  ["laurelsData"]
  (fn* () (let* (
      laurelsData (get-state "laurelsData")
      setstate1 (set-state "laurelSource" (get (nth laurelsData 0) "value"))
      setstate2 (set-state "laurelTarget" (get (nth laurelsData 0) "value"))
      lSAmount 1000
      setstate3 (set-state "laurelSourceAmount" lSAmount)
    )
    (react-div {} (list
      (react-span {"key" 1"style" {
       					"fontSize" "23px"
                        "fontFamily" "cursive"
                        "color" "blue"
                        "marginRight" "20px"
      } } "Exchange ")
      (react-input { "style" {
      						        					"backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                                                        "marginBottom" "10px"
                                                        "width" "100px"
      }
        "key" 2
        "defaultValue" lSAmount
        "onChange" (fn* (val)
          (set-state "laurelSourceAmount" val)
        )
      })
      (react-select { "style" {
      								      				"backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                                                        "marginBottom" "10px"
                                                        "width" "100px"
      }
        "key" 3
        "options" laurelsData
        "onChange" (fn* (val)
          (set-state "laurelSource" val)
        )
      })
      (react-span {"key" 4 "style" {"fontSize" "20px" "color" "black" "fontFamily" "cursive"} } "to ")
      (watch ["laurelSource" "laurelSourceAmount" "laurelTarget"] (fn* ()
        (let* (
            value (react-Contract-call
              "TheLaurel"
              "exchangeAmount"
              (get-state "laurelSource")
              (get-state "laurelSourceAmount")
              (get-state "laurelTarget")
            )
            value (str (bn-toNumber value))
          )
          (react-span {"key" 5 "style" {"fontSize" "20px" "color" "black" "fontFamily" "cursive"} } (str value " "))
        )
      ) true )
      (react-select { "style" {
      								      				"backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                                                        "marginBottom" "10px"
                                                        "width" "100px"
      }
        "key" 6
        "options" laurelsData
        "onChange" (fn* (val)
          (set-state "laurelTarget" val)
        )
      })
      (react-Contract {
        "key" 7
        "name" "TheLaurel"
        "function" "exchangeLaurels"
        "input" "laurelSource,laurelSourceAmount,laurelTarget"
        "output" "exchangeLaurelsReceipt"
        "hidden" "input"
      })
    ))
  ))
  true
)>

::br[]{}
::br[]{}


::a[]{id="registerTask"}

::Text[Register Task]{class="subHeading"}
<newTaskInfo:(watch ["widthfirst"] (fn* ()
(react-div {"style" (if (get-state "widthfirst") {"display" "flex"} {}) } (list
  (if true
    (let* (
        ratio {"x" 1531 "y" 1000}
        llll (set-state "newTaskRatio" ratio)
        componentDidMount (fn* (props state stateChangers)
          (graphs-voting-continuous {
            "id" "choosingRatio"
            "ratio" ratio
            "onChange" (fn* (val) (set-state "newTaskRatio" val ))
          })
        )

        render (fn* (props state stateChangers)
          (react-div {"id" "choosingRatio"})
        )
      )
      (react {} {} {"render" render "componentDidMount" componentDidMount})
    )
    nil
  )
  (react-div {"key" 2} (list
    (watch
      ["volunteersData" "laurelsData" "githubIssues"]
      (fn* ()
        (let* (
            volunteersData (get-state "volunteersData")
            laurelsData (get-state "laurelsData")
            githubIssues (get-state "githubIssues")
            issues (concat [{"value" nil "label" ""}] (map
              (fn* (val index)
                {"value" (get val "html_url") "label" (get val "title")}
              )
              (filter
                (fn* (val) (if (nil? (get val "pull_request")) true false))
                githubIssues
              )
            ))
            taskid (fn* (val) (eth-utils-solidityKeccak256 ["string"] [val]))
            newTaskOrganizer (eth-signer-getAddress)
            setinistate (list
              ;; organizer is msg.sender
              (set-state "newTaskOrganizer" newTaskOrganizer)
              (set-state "newTaskLaurelid" (get (nth laurelsData 0) "value"))
              (set-state "newTaskId" nil)
              (set-state "investArbitration" false)
            )
          )
          (react-div {"style" {"marginTop" "100px" "marginLeft" "30px"} } (list
            (react-div {"key" 1} (list
            (react-span {"key" 11 "style" {				
                               "color" "blue" 
            	 			 "fontSize" "18px"
             				 "fontFamily" "cursive" 
            } } "Organizer: ")
              (react-span {"key" 12 "style" {
              								"color" "black"                                         
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "40px"
                                                        "marginRight" "10px"
                                                        "marginTop" "0px"
                                                        "fontSize" "23px"
                                                        "marginLeft" "18px"
              }} (str  (get volunteersMap newTaskOrganizer)))
            ))
            (react-div {"key" 2 "style" {"marginTop" "15px"}} (list
              (react-span {"key" 21 "style" {
              				 "color" "blue" 
            	 			 "fontSize" "18px"
             				 "fontFamily" "cursive"                        
              }} "GitHub issue: ")
              (react-select { "style" {
              						                 	"width" "700px"
              											  "backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                                                        "marginLeft" "35px"
              }
                "key" 22
                "options" issues
                "onChange" (fn* (val)
                  (set-state "newTaskId" (if (nil? val) nil (taskid val)))
                )
              })
              (react-div {"key" 133 "style" {"marginTop" "15px"}} (list
              (react-span {"key" 23 "style" {
              				 "color" "blue" 
            	 			 "fontSize" "18px"
             				 "fontFamily" "cursive"    
              }} " (or) url ")
              (react-input { "style" {
              										      "width" "700px"
              											  "backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                                                        "marginLeft" "90px"
}
                "key" 24
                "placeholder" "url"
                "onChange" (fn* (val)
                  (set-state "newTaskId" (if (nil? val) nil (taskid val)))
                )
              })
              ))
            ))
            (react-div {"key" 3 "style" {"marginTop" "15px" } } (list
              (react-select {"style" {
      								      				"backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                                                        "marginBottom" "10px"
                                                        "width" "100px"
      }
                "key" 31
                "options" (get-state "laurelsData")
                "onChange" (fn* (val)
                  (set-state "newTaskLaurelid" val)
                )
              })
              (react-input {"style" {
              				      						"backgroundColor" "gray"
                                                        "color" "black"
                                                        "fontFamily" "cursive"
                                                        "fontWeight" "bold"
                                                        "paddingRight" "10px"
                                                        "paddingLeft" "10px"
                                                        "marginRight" "10px"
                                                        "marginBottom" "10px"
                                                        "width" "100px"
              }
                "key" 32
                "placeholder" "amount: mLaurels"
                "defaultValue" 1000
                "onChange" (fn* (val) (set-state "newTaskLaurelAmount" val))
              })
              (react-span {"key" 33 "style" {"fontSize" "20px" "color" "black" "fontFamily" "cursive"} } " mLaurels")
            ))
            (react-div {"key" 4 "marginTop" "15px"} (list
              (react-span {"key" 41 "style" {"fontSize" "18px" "color" "blue" "fontFamily" "cursive"} } "Invest Arbitration Laurels: ")
              (react-checkbox {
                "key" 42
                "style" {"verticalAlign" "middle" "marginLeft" "5px" "marginRight" "5px"}
                "onChange" (fn* (v)
                  (set-state "investArbitration" v)
                )
              })
            ))
          ))
        )
      )
      true
    )
    (react-div {"key" 5 "style" {"marginTop" "20px"}})
    (react-Contract {
      "key" 4
      "name" "TheLaurel"
      "function" "registerTask"
      "input" "newTaskId,newTaskInfo,investArbitration"
      "output" "registrationReceipt"
    })
  ))
))
))>


<formNewTaskInfo:(watch
  ["newTaskRatio" "newTaskOrganizer" "newTaskLaurelid" "newTaskLaurelAmount"]
  (fn* () (let* (
      newTaskRatio (get-state "newTaskRatio")
      newTaskRatio (if (nil? newTaskRatio) {} newTaskRatio)
      taskinfo (assoc
        newTaskRatio
        "organizer" (get-state "newTaskOrganizer")
        "laurelid" (get-state "newTaskLaurelid")
        "amount" (get-state "newTaskLaurelAmount")
      )
    )
    (set-state "newTaskInfo" (js-var taskinfo))
  ))
)>

::br[]{}

::a[]{id="registerVolunteer"}

::Text[Volunteer Registration Process]{class="subHeading"}
- fill in this :Link[form with email registration]{src="https://forms.gle/bdtrUTSEGuL2dtys9"}
- you will receive access to our Discord chat
- create an Ethereum address, get Rinkeby ETH - :Link[try this Rinkeby faucet]{src="https://faucet.rinkeby.io/"}
- find an already registered volunteer to be your ancestor and give them your Ethereum address, so they can register it in the form below
- get access to the-laurel-volunteers GitHub repo & more


::Text[Register a volunteer with you as the ancestor:]{class="subHeading"}
::Contract[]{name="TheLaurel" function="registerVolunteer" output="registerVolunteerReceipt"}

::br[]{}
::br[]{}
::br[]{}




























```
