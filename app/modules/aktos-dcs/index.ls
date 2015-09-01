require! {
  './aktos-dcs': {
    envelp,
    get-msg-body,
    Actor,
    ProxyActor,
  }
}
  
require! {
  './widgets': {
    RactivePartial,
    get-ractive-var,
    set-ractive-var, 
  }
}
  
require! {
  './aktos-dcs-lib': {
    SwitchActor
  }
}
  
module.exports = {
  envelp, get-msg-body, Actor, ProxyActor, 
  RactivePartial, get-ractive-var, set-ractive-var, 
  SwitchActor,
}