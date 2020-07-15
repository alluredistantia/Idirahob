unit BonlivWebDAOU;

interface

uses
  System.Generics.Collections, BonLivWebDTOU;
type TListBonLivDTO=TObjectList<TBonLivWebDTO>;


Type TBonlivWebDAO=class(TObject)
  function getBonLivs:TListBonLivDTO;
  function getNbr:integer;
  function Save(vBonLivDTO:TBonLivWebDTO): integer;
end;


implementation



{ TInventDAO }

uses APIUtilsU, REST.Json, System.SysUtils;

function TBonlivWebDAO.getBonLivs:TListBonLivDTO;
var
  ListBonLiv:TListBonLivDTO;
  oInventDTO:TBonLivWebDTO;
  i:Integer;
  vNbr:integer;
begin
  vNbr:=self.getNbr;
  ListBonLiv:=TJson.JsonToObject<TListBonLivDTO>
  ('{"ownsObjects": true,"listHelper": ['+inttostr(vNbr)+'], "items":'+
  RestReqGet.create(nil,'BonLiv/getBonLivs').Response.JSONValue.ToString+'}');
  result:=ListBonLiv;
end;

function TBonlivWebDAO.getNbr: integer;
begin
Result:=strtoint(RestReqGet.create(nil,'BonLiv/getNbr').Response.JSONValue.ToString);

end;

function TBonlivWebDAO.Save(vBonLivDTO:TBonLivWebDTO): integer;
begin
RestReqPost.create(TJson.ObjectToJsonObject(vBonLivDTO),
'BonLiv/setBonLiv');
end;

end.
