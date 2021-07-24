
## UnCompleted Code
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
           "Heading" {
                                  "text-align" "center"
                                 "font-size" "50px"
                                 "font-weight" "bold"
                                 "font-family" "cursive"
                                 "color" "black"
                                 "margin" "0px"
           }
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












```
