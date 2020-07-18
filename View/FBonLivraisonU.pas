unit FBonLivraisonU;

interface

uses
  System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Rtti, FMX.Grid.Style, FMX.Controls.Presentation, FMX.ScrollBox,
  FMX.Grid, FMX.Layouts, InventDTOU, InventDAOU, MInventU,
  MRInventU, RInventDTOU, FMX.Edit, FMX.Objects,
  System.Generics.Collections, BonLivWebDTOU,RBonLivWebDTOU, MBonLivU;

type
  TFBonLivraison = class(TFrame)
    Layout1: TLayout;
    Layout2: TLayout;
    SGEntete: TStringGrid;
    SGDetail: TStringGrid;
    Layout3: TLayout;
    Layout4: TLayout;
    BAjout: TButton;
    BSupp: TButton;
    BModif: TButton;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    Layout5: TLayout;
    BAjoutDtail: TButton;
    BSuppDetail: TButton;
    BModifDetail: TButton;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    StringColumn7: TStringColumn;
    Bretour: TButton;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Rectangle2: TRectangle;
    ETotal: TEdit;
    Label2: TLabel;
    Bferme: TButton;
    BsuppAll: TButton;
    Rectangle3: TRectangle;
    DesColumn: TStringColumn;
    VertScrollBox1: TVertScrollBox;
    Rectangle4: TRectangle;
    PrixCartonColumn: TStringColumn;
    Rectangle5: TRectangle;
    ColFour: TStringColumn;
    procedure SGEnteteCellClick(const Column: TColumn; const Row: Integer);
    procedure BretourClick(Sender: TObject);
    procedure BSuppClick(Sender: TObject);
    procedure SGDetailCellClick(const Column: TColumn; const Row: Integer);
    procedure BModifDetailClick(Sender: TObject);
    procedure BfermeClick(Sender: TObject);
    procedure BSuppDetailClick(Sender: TObject);
    procedure BsuppAllClick(Sender: TObject);
    procedure BAjoutClick(Sender: TObject);
    procedure BModifClick(Sender: TObject);
  private
    { D�clarations priv�es }
  public


  oMBonLiv:TMBonLiv;
  //oMRPreAchat:TMRPreAchat;
  oSelectedbonlivDTO:TBonLivWebDTO;
  oSelectedRbonlivDTO:TRBonLivWebDTO;
  procedure AfficherEntete;
//  procedure AfficherDetail(sg:TStringGrid;vbonlivWebDTO:TBonLivWebDTO;etot:Tedit);
    { D�clarations publiques }
  end;

type TListBonLivWebDTO=TObjectList<TBonLivWebDTO>;
TListRBonLivWebDTO=TObjectList<TRBonLivWebDTO>;
implementation

uses
  MainU, System.SysUtils, PreAchatLocDAOU, RPreAchatLocDAOU, BarCodeLocDAOU,
  ArticleLocDAOU, ArticleLocDTOU, BarCodeLocDTOU,
  BonlivWebDAOU, RBonLivWabDAOU, FourWebDTOU, APIUtilsU,REST.Json, FourWebDAOU;



{$R *.fmx}

{ TFInvent }

{procedure TFBonLivraison.AfficherDetail(sg:TStringGrid;vbonlivWebDTO:TBonLivWebDTO;etot:Tedit);
 var
 RBonLivList:TListBonLivWebDTO;
  ORBonLivWebDTO:TRBonLivWebDTO;
 // oBarCodeLocDAO: TBarCodeLocDAO;
  i:Integer;
  vNbr:integer;
begin
  vNbr:=TRBonLivWebDAO.create.getNbrRBonLivsByBonLiv(vbonlivWebDTO.idbonliv);
  SGDetail.RowCount:=vNbr;
  for i := 0 to sg.RowCount-1 do
  begin
   sg.Cells[0,i]:='';
   sg.Cells[1,i]:='';
   sg.Cells[2,i]:='';
   sg.Cells[3,i]:='';
   {sadaoui :}
  { sg.Cells[4,i]:='';
   sg.Cells[5,i]:='';

  end;
 RpreachatList:=TRPreAchatLocDAO.create.getRPreAchatsByPreAchat(Self.oSelectedpreAchatDTO.idpreachatloc);

  i:=0;
  for ORPreachatlocDTO in RpreachatList do
  begin
    sg.Cells[0,i]:=IntToStr(ORPreachatlocDTO.idrpreachatloc);
    sg.Cells[1,i]:=ORPreachatlocDTO.idbarcodeloc;
    sg.Cells[2,i]:=TBarCodeLocDAO.create.
    getArticleLocDTO(TBarCodeLocDTO.create(ORPreachatlocDTO.idbarcodeloc)).desarticleloc;
    sg.Cells[3,i]:=FloatToStr(ORPreachatlocDTO.qtepreachatloc);
    sg.Cells[4,i]:=FloatToStr(ORPreachatlocDTO.prixpreachatloc);
    {sadaoui: }
    {sg.Cells[5,i]:=TArticleLocDAO.create.Prixcarton(TBarCodeLocDAO.create.getArticleLocDTO(TBarCodeLocDTO.create(ORPreachatlocDTO.idbarcodeloc))).ToString;
     {fin}
   { inc(i);
  end;
  etot.Text:=FormatFloat('#,##0',TRPreAchatLocDAO.Create.totalMontants(vPreAchatLocDTO)); }
//end;

procedure TFBonLivraison.AfficherEntete;
var
  BonLivList:TListBonLivWebDTO;
  OBonLivWebDTO:TBonLivWebDTO;
  oFourDTO  :TFourWebDTO;
  i:Integer;
  vNbr:integer;
begin

  vNbr:=TBonlivWebDAO.create.getNbr;
  SGEntete.RowCount:=vNbr;
  for i := 0 to SGEntete.RowCount-1 do
  begin
    SGEntete.Cells[0,i]:='';
    SGEntete.Cells[1,i]:='';
    SGEntete.Cells[2,i]:='';
    SGEntete.Cells[3,i]:='';
  end;
  BonLivList:=TBonLivWebDAO.create.getBonLivs;
   //ShowMessage(BonLivList.First.idbonliv.ToString);
  i:=0;
  for OBonLivWebDTO in BonLivList do
  begin
  //oFourDTO:=TJSON.JsonToObject<TFourWebDTO>(RestReqGet.create(nil,'BonLiv/getFour/'+OBonLivWebDTO.idbonliv.ToString).Response.JSONValue.ToString);
    SGEntete.Cells[0,i]:=IntToStr(OBonLivWebDTO.idbonliv);
    SGEntete.Cells[1,i]:=OBonLivWebDTO.desbonliv;
    SGEntete.Cells[2,i]:=OBonLivWebDTO.date_;
    SGEntete.Cells[3,i]:=TBonlivWebDAO.Create(OBonLivWebDTO).getFourwebDTO.desfour;//OBonLivWebDTO.idfour.ToString;   //
    inc(i);
  end;
  SGEntete.Row:=0;
  SGEnteteCellClick(Self.StringColumn1,0);
end;

procedure TFBonLivraison.BSuppClick(Sender: TObject);
begin
TBonLivWebDAO.create(oSelectedbonlivDTO).delete;
AfficherEntete;

end;

procedure TFBonLivraison.BretourClick(Sender: TObject);
begin
main.TabControl1.ActiveTab:=Main.TMain;
Self.DisposeOf;
end;

procedure TFBonLivraison.BsuppAllClick(Sender: TObject);
begin
{if Assigned(oSelectedpreAchatDTO)=true  then
TRPreAchatLocDAO.create().deleteAll(oSelectedpreAchatDTO);
Self.AfficherDetail(SGDetail,oSelectedpreAchatDTO,ETotal); }
end;

procedure TFBonLivraison.BSuppDetailClick(Sender: TObject);
begin
 { if Assigned(oSelectedRpreAchatDTO)=true  then
  TRPreAchatLocDAO.create().delete(oSelectedRpreAchatDTO);
  Self.AfficherDetail(SGDetail,oSelectedpreAchatDTO,ETotal);  }
end;

procedure TFBonLivraison.BModifClick(Sender: TObject);
var oBonLivDTO:TBonLivWebDTO;
begin
oMBonLiv:=TMBonLiv.Create(nil);
oMBonLiv.Parent:=main.LayoutMAJAchat;
Main.TabControl1.ActiveTab:=Main.TMAJAchat;
oMBonLiv.EidBonLiv.Text:=IntToStr(oSelectedbonlivDTO.idbonliv);
oMBonLiv.EidBonLiv.Enabled:=false;
oMBonLiv.EdesBonLiv.Text:=oSelectedbonlivDTO.desbonliv;
oMBonLiv.Eidfour.Text:= IntToStr(oSelectedbonlivDTO.idfour);
//oMBonLiv.Edesfour.text:=TFourWebDAO.create.getFourById(oSelectedbonlivDTO.idbonliv).desfour;

end;

procedure TFBonLivraison.BModifDetailClick(Sender: TObject);
//var oarticlelocDTO: TArticleLocDTO;
//obarcodelocdto: TBarCodeLocDTO;
begin
//if Assigned(oSelectedRpreAchatDTO)=true then
//begin
  {oMRPreAchat:=TMRPreAchat.Create(nil);
  oMRPreAchat.Parent:=main.LayoutMAJAchat;
  Main.TabControl1.ActiveTab:=Main.TMAJAchat;
  oMRPreAchat.oidRPreAchat:=oSelectedRpreAchatDTO.idrpreachatloc;
  oMRPreAchat.EidBarCode.Text:=oSelectedRpreAchatDTO.idbarcodeloc;
  oMRPreAchat.EQtePreAchat.Text:=FloatToStr(oSelectedRpreAchatDTO.qtepreachatloc);
  oMRPreAchat.ELastPrixAchat.Text:=FloatToStr(oSelectedRpreAchatDTO.prixpreachatloc);
  oMRPreAchat.EidBarCode.Enabled:=false;
  oMRPreAchat.EdesArticle.Enabled:=false;
  //oarticlelocDTO:= TArticleLocDTO.create;
  obarcodelocdto:= TBarCodeLocDTO.create(oSelectedRpreAchatDTO.idbarcodeloc);
  oMRPreAchat.EdesArticle.Text:= TBarCodeLocDAO.create.getArticleLocDTO(obarcodelocdto).desarticleloc;
  {sadaoui :ajouter prix de carton}
  {oMRPreAchat.Eprixcarton.Text:= TArticleLocDAO.create.Prixcarton(TBarCodeLocDAO.create.getArticleLocDTO(obarcodelocdto)).ToString;
  oMRPreAchat.ElastQteAchat.Text:= TBarCodeLocDAO.create.getArticleLocDTO(obarcodelocdto).lastqteachat.ToString;
  {fin modif sadaoui}
//end else
//begin
//  ShowMessage('Selectionner un codeBare � modifier');
//end;
end;

procedure TFBonLivraison.BAjoutClick(Sender: TObject);
begin
oMBonLiv:=TMBonLiv.Create(nil);
oMBonLiv.Parent:=main.LayoutMAJAchat;
oMBonLiv.EidBonLiv.Text:=TBonLivWebDAO.Create.getNewID.ToString;
Main.TabControl1.ActiveTab:=Main.TMAJAchat;
end;

procedure TFBonLivraison.BfermeClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFBonLivraison.SGDetailCellClick(const Column: TColumn;
  const Row: Integer);
begin

//if Assigned(oSelectedRpreAchatDTO) then oSelectedRpreAchatDTO.DisposeOf;
//oSelectedRpreAchatDTO:=TRPreAchatLocDTO.Create();
//oSelectedRpreAchatDTO.idrpreachatloc:=strtoInt(SGDetail.Cells[0,Row]);
//oSelectedRpreAchatDTO.idpreachatloc:=oSelectedpreAchatDTO.idpreachatloc;
//oSelectedRpreAchatDTO.idbarcodeloc:=SGDetail.Cells[1,SGDetail.Row];
//oSelectedRpreAchatDTO.qtepreachatloc:=StrToFloat(SGDetail.Cells[3,Row]);
//oSelectedRpreAchatDTO.prixpreachatloc:=StrToFloat(SGDetail.Cells[4,Row]);


end;

procedure TFBonLivraison.SGEnteteCellClick(const Column: TColumn; const Row: Integer);
var
oRPreAchatLocDAO:TRPreAchatLocDAO ;
begin
if Assigned(oSelectedbonlivDTO)=true then oSelectedbonlivDTO.DisposeOf;
oSelectedbonlivDTO:=TBonLivWebDTO.Create;
oSelectedbonlivDTO.idbonliv:=strtoInt(SGEntete.Cells[0,Row]);
oSelectedbonlivDTO.desbonliv:=SGEntete.Cells[1,Row];
//Self.AfficherDetail(SGDetail,oSelectedpreAchatDTO,ETotal);
//if TPreAchatLocDAO.Create.hasDetail(oSelectedpreAchatDTO) then
//Self.SGDetailCellClick(Self.StringColumn3,0);
end;




end.
