unit FourWebDAOU;

interface

uses
  System.Generics.Collections,FourWebDTOU;
type TLisTFourWebDTO=TObjectList<TFourWebDTO>;
TYPE TFourWebDAO=class(TObject)
FFourwebDTO:TFourWebDTO;
public
constructor create(oFourDTO:TFourWebDTO);overload;
constructor create;overload;
function save:integer;
function delete:integer;
function getNbrFour:integer;
function getNbrLike(str:string):integer;
function getListByText(textLike:string):TLisTFourWebDTO;
function getFourById(id:Integer):TFourWebDTO;
function getFours:TLisTFourWebDTO;
function getMaxIdFour: Integer;
end;

implementation

uses  APIUtilsU, REST.Json, System.SysUtils;

{ TFourWebDAO }

constructor TFourWebDAO.create;
begin

end;

constructor TFourWebDAO.create(oFourDTO: TFourWebDTO);
begin
 Self.FFourwebDTO:=oFourDTO;
end;

function TFourWebDAO.delete: integer;
begin
 RestReqPost.create(TJson.ObjectToJsonObject(FFourwebDTO),
'Four/delFour');
end;

function TFourWebDAO.getFourById(id: Integer): TFourWebDTO;
begin
//Result:=RestReqGet.create(nil,'Four/getFourById/'+id).Response.JSONValue.ToString;

end;

function TFourWebDAO.getFours: TLisTFourWebDTO;
var
  FourList:TLisTFourWebDTO;
  OFour:TFourWebDTO;
  i:Integer;
  vNbr:integer;

begin
vNbr:=Self.getNbrFour;
FourList:=TJson.JsonToObject<TLisTFourWebDTO>
('{"ownsObjects": true,"listHelper": ['+inttostr(vNbr)+'], "items":'+
RestReqGet.create(nil,'Four/getFours').Response.JSONValue.ToString+'}');
result:=FourList;

end;

function TFourWebDAO.getListByText(textLike: string): TLisTFourWebDTO;
var
  FourList:TLisTFourWebDTO;
  OFour:TFourWebDTO;
  i:Integer;
  vNbrLike:integer;
begin

if textLike<>'' then
begin
  vNbrLike:=self.getNbrLike(textLike);
  FourList:=TJson.JsonToObject<TLisTFourWebDTO>
  ('{"ownsObjects": true,"listHelper": ['+inttostr(vNbrLike)+'], "items":'+
  RestReqGet.create(nil,'Four/getFoursLike/'+textLike).Response.JSONValue.ToString+'}');
  result:=FourList;
end;

end;

function TFourWebDAO.getMaxIdFour: Integer;
begin
Result:=StrToInt(RestReqGet.create(nil,'Four/getMaxIdFour').
Response.JSONValue.ToString)+1;
end;

function TFourWebDAO.getNbrFour: integer;
begin
Result:=strtoint(RestReqGet.create(nil,'Four/getNbr').Response.JSONValue.ToString);

end;

function TFourWebDAO.getNbrLike(str: string): integer;
begin
 Result:=strtoint(RestReqGet.create(nil,'Four/getNbrLike/'+str).Response.JSONValue.ToString);
end;

function TFourWebDAO.save: integer;
begin
 RestReqPost.create(TJson.ObjectToJsonObject(FFourwebDTO),
'Four/setFour');
end;

end.
