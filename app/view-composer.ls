H = require \./helper
C = require \./collection
M = require \./model
S = require \./session
V = require \./view
D = require \./view-directive

exports
  ..edge = (id, act, child-id) ->
    V.edge.render (edge = C.Edges.get id), D.edge
    V.meta.render edge, D.meta
    render-evidences id, act, child-id
    render-notes     id, act
    return edge
  ..edges = ->
    V.edges-head.render!
    V.edges     .render C.Edges, D.edges
  ..node = (id, act, child-id) ->
    V.node           .render (node = C.Nodes.get id), D.node
    V.node-edges-head.render!
    V.node-edges-a   .render (C.Edges.find -> id is it.get \a_node_id), D.edges
    V.node-edges-b   .render (C.Edges.find -> id is it.get \b_node_id), D.edges
    V.meta           .render node, D.meta
    render-evidences id, act, child-id
    render-notes     id, act
    return id
  ..nodes = ->
    V.nodes-head.render!
    V.nodes.render C.Nodes, D.nodes
  ..user = ->
    V.user.render (C.Users.get(id = it or C.Sessions.models.0?id)), D.user
    render-user-entities id, V.edges    , C.Edges    , D.edges
    render-user-entities id, V.evidences, C.Evidences, D.user-evidences
    render-user-entities id, V.nodes    , C.Nodes    , D.nodes
    render-user-entities id, V.notes    , C.Notes    , D.user-notes

function render-evidences entity-id, act, id then
  evs = C.Evidences.find -> entity-id is it.get \entity_id
  ev  = C.Evidences.get id if act is \evi-edit
  ev  = M.Evidence.create!set \entity_id, entity-id if act is \evi-new
  V.evidences-head.render void, D.evidences-head
  V.evidence-edit .render ev, C.Evidences, fetch:no if ev
  V.evidences     .render evs, D.evidences, void-view:V.evidences-void

function render-notes entity-id, act then
  notes = C.Notes.find -> entity-id is it.get \entity_id
  note-by-signin =
    if act is \note-new then M.Note.create!set \entity_id, entity-id
    else notes.find(-> S.is-signed-in it.get \meta.create_user_id).models?0
  V.notes-head.render note-by-signin, D.notes-head
  V.note-edit .render note-by-signin, C.Notes, fetch:no if act in <[ note-edit note-new ]>
  V.notes     .render notes, D.notes

function render-user-entities user-id, view, coll, directive then
  view.render (coll.find -> user-id is it.get \meta.create_user_id), directive
