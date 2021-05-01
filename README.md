# Transformers
* Views
    * Carries UI of the App
* ViewModels
    * ViewModels responsible for handling network calls , logic & data bindings
    *  “StartViewModel“ handles initial screen logic and Spark Api
    *  “AddTransformerViewModel” responsible for adding transformer & updating a tranformer including /transformer api call
    *  “TransformerListViewModel” handling logic for getting transformer list from server and binding to view
    * 
* Model
    * Tranformer
        * Represents transformer Anatomy
* Controller
    *  StartVC initial screen displaying menu 
    *  AddTransformerVC screen add/update transformer
    *  TransformerList shows list of all items added
    * RageWar a war between autobot & deceptions
* Router
    * Responsible for controller to controller navigation
* Network Layer
    * API CALLS HANDLING
* Request Parser
    * API RESULT HANDLING
