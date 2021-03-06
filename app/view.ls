F           = require \fs # browserified
Insert-css  = require \./lib-3p/insert-css
V           = require \./view-engine
V-Graph     = require \./view/graph
V-GraphTBar = require \./view/graph/toolbar
V-Home      = require \./view/home
V-NavBar    = require \./view/navbar
V-Session   = require \./view/session
V-SignOut   = require \./view/user-signout
V-Version   = require \./view/version

Insert-css F.readFileSync __dirname + \/view.css

D-About         = F.readFileSync __dirname + \/doc/about.html
T-EdgeEdit      = F.readFileSync __dirname + \/view/edge-edit.html
T-Edge          = F.readFileSync __dirname + \/view/edge.html
T-Edges         = F.readFileSync __dirname + \/view/edges.html
T-EdgesHead     = F.readFileSync __dirname + \/view/edges-head.html
T-EvidenceEdit  = F.readFileSync __dirname + \/view/evidence-edit.html
T-Evidences     = F.readFileSync __dirname + \/view/evidences.html
T-EvidencesHead = F.readFileSync __dirname + \/view/evidences-head.html
T-EvidencesVoid = F.readFileSync __dirname + \/view/evidences-void.html
T-Footer        = F.readFileSync __dirname + \/view/footer.html
T-Meta          = F.readFileSync __dirname + \/view/meta.html
T-Node          = F.readFileSync __dirname + \/view/node.html
T-NodeEdit      = F.readFileSync __dirname + \/view/node-edit.html
T-NodeEdgesA    = F.readFileSync __dirname + \/view/node-edges-a.html
T-NodeEdgesB    = F.readFileSync __dirname + \/view/node-edges-b.html
T-NoteEdit      = F.readFileSync __dirname + \/view/note-edit.html
T-Nodes         = F.readFileSync __dirname + \/view/nodes.html
T-NodesHead     = F.readFileSync __dirname + \/view/nodes-head.html
T-Notes         = F.readFileSync __dirname + \/view/notes.html
T-NotesHead     = F.readFileSync __dirname + \/view/notes-head.html
T-User          = F.readFileSync __dirname + \/view/user.html
T-UserEdit      = F.readFileSync __dirname + \/view/user-edit.html
T-UserSignin    = F.readFileSync __dirname + \/view/user-signin.html
T-Users         = F.readFileSync __dirname + \/view/users.html

exports
  ..doc-about       = new V.DocuView document:D-About        , el:\.view>.main
  ..edge            = new V.InfoView template:T-Edge         , el:\.view>.main
  ..edge-a-node-sel = new V.SelectView                         tagName:\#a_node_id
  ..edge-b-node-sel = new V.SelectView                         tagName:\#b_node_id
  ..edge-edit       = new V.EditView template:T-EdgeEdit     , el:\.view>.main
  ..edges           = new V.ListView template:T-Edges        , el:\.view>.edges
  ..edges-head      = new V.InfoView template:T-EdgesHead    , el:\.view>.main
  ..evidence-edit   = new V.EditView template:T-EvidenceEdit , el:\.view>.evidence-edit
  ..evidences       = new V.ListView template:T-Evidences    , el:\.view>.evidences
  ..evidences-head  = new V.InfoView template:T-EvidencesHead, el:\.view>.evidences-head
  ..evidences-void  = new V.DocuView document:T-EvidencesVoid, el:\.view>.evidences
  ..footer          = new V.DocuView document:T-Footer       , el:\.footer
  ..graph           = new V-Graph                              el:\.view>.graph
  ..graph-toolbar   = new V-GraphTBar                          el:\.view>.graph
  ..home            = new V-Home                               el:\.view>.main
  ..meta            = new V.InfoView template:T-Meta         , el:\.view>.meta
  ..navigator       = new V-NavBar                             el:\.navigator
  ..node            = new V.InfoView template:T-Node         , el:\.view>.main
  ..node-edit       = new V.EditView template:T-NodeEdit     , el:\.view>.main
  ..node-edges-a    = new V.ListView template:T-NodeEdgesA   , el:\.view>.node-edges-a
  ..node-edges-b    = new V.ListView template:T-NodeEdgesB   , el:\.view>.node-edges-b
  ..node-edges-head = new V.InfoView template:T-EdgesHead    , el:\.view>.node-edges-head
  ..nodes           = new V.ListView template:T-Nodes        , el:\.view>.nodes
  ..nodes-head      = new V.InfoView template:T-NodesHead    , el:\.view>.main
  ..note-edit       = new V.EditView template:T-NoteEdit     , el:\.view>.note-edit
  ..notes           = new V.ListView template:T-Notes        , el:\.view>.notes
  ..notes-head      = new V.InfoView template:T-NotesHead    , el:\.view>.notes-head
  ..session         = new V-Session                            el:\.view>.main
  ..user            = new V.InfoView template:T-User         , el:\.view>.main
  ..user-edit       = new V.EditView template:T-UserEdit     , el:\.view>.main
  ..user-signin     = new V.EditView template:T-UserSignin   , el:\.view>.main
  ..user-signout    = new V-SignOut
  ..user-signup     = new V.EditView template:T-UserEdit     , el:\.view>.main
  ..users           = new V.ListView template:T-Users        , el:\.view>.main
  ..version         = new V-Version                            el:\.version
