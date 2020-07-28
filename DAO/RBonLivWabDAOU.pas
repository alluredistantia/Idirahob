unit RBonLivWabDAOU;

interface
uses RBonLivWebDTOU, System.Generics.Collections, FourWebDTOU, BarCodeWebDTOU;
type RBonLivListDTO=TObjectList<TRBonLivWebDTO>;
type TRBonLivWebDAO=class (TObject)
FRBonLivWebDTO:TRBonLivWebDTO;
public
function getNewId:integer;
function save(vRBonLivWebDTO:TRBonLivWebDTO): integer;
function getRBonLivsByBonLiv(vBonLiv:integer): RBonLivListDTO;
function getNbrRBonLivsByBonLiv(vBonLiv:integer): integer;
function delete(orBonLivDTO:TRBonLivWebDTO): integer;
function deleteAll(idbonliv:Integer): integer;
function getBarcodewebDTO:TBarCodeWebDTO;
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



function TRBonLivWebDAO.delete(orBonLivDTO:TRBonLivWebDTO): integer;
begin
 //Result:=strtoint(RestReqGet.create(nil,'rBonLiv/delRBonLiv'+orBonLivDTO).Response.JSONValue.ToString);

end;

function TRBonLivWebDAO.deleteAll(idbonliv:Integer): integer;
begin
 //Result:=strtoint(RestReqGet.create(nil,'rBonLiv/delRBonLivbyBonLiv'+idbonliv).Response.JSONValue.ToString);

end;

function TRBonLivWebDAO.getBarcodewebDTO: TBarCodeWebDTO;
begin
Result:=TJSON.JsonToObject<TBarCodeWebDTO>(RestReqGet.create(nil,'rBonLiv/getBarCode/'+Self.FRBonLivWebDTO.idrbonliv.ToString).Response.JSONValue.ToString);

end;

function TRBonLivWebDAO.getNbr: integer;
begin
Result:=strtoint(RestReqGet.create(nil,'rBonLiv/getNbr').Response.JSONValue.ToString);

end;


function TRBonLivWebDAO.save(vRBonLivWebDTO:TRBonLivWebDTO): integer;
begin

RestReqPost.create(TJson.ObjectToJsonObject(vRBonLivWebDTO),
'rBonLiv/setRBonLiv');
end;

end.
