unit BonlivWebDAOU;

interface

uses
  System.Generics.Collections, BonLivWebDTOU, FourWebDTOU;
type TListBonLivDTO=TObjectList<TBonLivWebDTO>;


Type TBonlivWebDAO=class(TObject)
FBonLivWebDTO:TBonLivWebDTO;
 public
  constructor create(oBonLivDTO:TBonLivWebDTO);overload;
  constructor create;overload;
  function getBonLivs:TListBonLivDTO;
  function getNbr:integer;
  function Save(vBonLivDTO:TBonLivWebDTO): integer;
  function getFourwebDTO: TFourWebDTO;
  function getNewID: Integer;
  function delete: integer;
end;


implementation



{ TInventDAO }

uses APIUtilsU, REST.Json, System.SysUtils;

constructor TBonlivWebDAO.create;
begin

end;

constructor TBonlivWebDAO.create(oBonLivDTO: TBonLivWebDTO);
begin
 self.FBonLivWebDTO:= oBonLivDTO;
end;

function TBonlivWebDAO.delete: integer;
begin
RestReqPost.create(TJson.ObjectToJsonObject(FBonLivWebDTO),
'BonLiv/delBonLiv');

end;


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

function TBonlivWebDAO.getFourwebDTO: TFourWebDTO;
begin
Result:=TJSON.JsonToObject<TFourWebDTO>(RestReqGet.create(nil,'BonLiv/getFour/'+Self.FBonLivWebDTO.idbonliv.ToString).Response.JSONValue.ToString);

end;

function TBonlivWebDAO.getNbr: integer;
begin
Result:=strtoint(RestReqGet.create(nil,'BonLiv/getNbr').Response.JSONValue.ToString);

end;

function TBonlivWebDAO.getNewID: Integer;
begin

Result:=StrToInt(RestReqGet.create(nil,'BonLiv/getNewId').Response.JSONValue.ToString);

end;

function TBonlivWebDAO.Save(vBonLivDTO:TBonLivWebDTO): integer;
begin
RestReqPost.create(TJson.ObjectToJsonObject(vBonLivDTO),
'BonLiv/setBonLiv');
end;

end.
