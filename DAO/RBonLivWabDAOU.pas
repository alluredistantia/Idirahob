unit RBonLivWabDAOU;

interface
uses RBonLivWebDTOU, System.Generics.Collections;
type RBonLivListDTO=TObjectList<TRBonLivWebDTO>;
type TRBonLivWebDAO=class (TObject)
function getNewId:integer;
function save(vRBonLivWebDTO:TRBonLivWebDTO): integer;
function getRBonLivsByBonLiv(vBonLiv:integer): RBonLivListDTO;
function getNbrRBonLivsByBonLiv(vBonLiv:integer): integer;
function getNbr: integer;
end;

implementation

uses
  APIUtilsU, REST.Json, System.SysUtils;

{ TRInventDAO }

function TRBonLivWebDAO.getNbrRBonLivsByBonLiv(vBonLiv:integer): integer;
begin
Result:=strtoint(RestReqGet.create(nil,'rBonLiv/getNbrRBonLivsByBonLiv/'+IntToStr(vBonLiv)).Response.JSONValue.ToString);

end;

function TRBonLivWebDAO.getNewId: integer;
begin
Result:=StrToInt(RestReqGet.create(nil,'rBonLiv/getNewId').Response.JSONValue.ToString);
end;

function TRBonLivWebDAO.getRBonLivsByBonLiv(vBonLiv:integer): RBonLivListDTO;
  var ListRBonLiv:RBonLivListDTO;
  oRBonLibWebDTO:TRBonLivWebDTO;
  i:Integer;
  vNbr:integer;
begin
  vNbr:=self.getNbrRBonLivsByBonLiv(vBonLiv);
  ListRBonLiv:=TJson.JsonToObject<RBonLivListDTO>
  ('{"ownsObjects": true,"listHelper": ['+inttostr(vNbr)+'], "items":'+
  RestReqGet.create(nil,'rBonLiv/getRBonLivsByBonLiv/'+IntToStr(vBonLiv)).Response.JSONValue.ToString+'}');
  result:=ListRBonLiv;
end;

function TRBonLivWebDAO.getNbr: integer;
begin
Result:=strtoint(RestReqGet.create(nil,'rBonLiv/getNbr').Response.JSONValue.ToString);

end;


function RBonLivWebDAO.save(vRBonLivWebDTO:TRBonLivWebDTO): integer;
begin
RestReqPost.create(TJson.ObjectToJsonObject(vRBonLivWebDTO),
'rBonLiv/setRBonLiv');
end;

end.
