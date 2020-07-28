unit MRBonLivU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Layouts,
  DataPak.Android.BarcodeScanner, FArticleLocU, FArticleWebU;

type
  TMRBonLiv = class(TFrame)
    BarcodeScanner1: TBarcodeScanner;
    Layout1: TLayout;
    BScan: TButton;
    EidBarCode: TEdit;
    BDisplayArticle: TButton;
    BrechArticle: TButton;
    EdesArticle: TEdit;
    Label1: TLabel;
    ELastPrixAchat: TEdit;
    Label2: TLabel;
    ElastQteAchat: TEdit;
    Label3: TLabel;
    Eprixcarton: TEdit;
    Label4: TLabel;
    EQteBonLiv: TEdit;
    Label5: TLabel;
    BValid: TButton;
    Button2: TButton;
    procedure BScanClick(Sender: TObject);
    procedure BDisplayArticleClick(Sender: TObject);
    procedure BrechArticleClick(Sender: TObject);
    procedure BValidClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    oidRBonLiv:integer;
     oFArticle:TFArticleWeb;
  end;

implementation

uses
  BarCodeLocDAOU, BarCodeLocDTOU, ArticleLocDTOU, ArticleLocDAOU,
  RBonLivWebDTOU, MainU, RBonLivWabDAOU, BarCodeWebDAOU, BarCodeWebDTOU,
  ArticleWebDTOU ;

{$R *.fmx}

procedure TMRBonLiv.BDisplayArticleClick(Sender: TObject);
var
oBarCodeWebDAO:TBarCodeWebDAO;
oBarCodeWebDTO:TbarCodeWebDTO;
oArticleDTO:TArticleWebDTO;

begin
oBarCodeWebDTO:=TbarCodeWebDTO.create(EidBarCode.text);
oBarCodeWebDAO:=TBarCodeWebDAO.create(oBarCodeWebDTO);
oArticleDTO:=oBarCodeWebDAO.getArticleWebDTO;
EdesArticle.Text:=oArticleDTO.desarticle;
ELastPrixAchat.Text:=FloatToStr(oArticleDTO.lastprixachat);
ElastQteAchat.Text:=FloatToStr(oArticleDTO.lastqteachat);
{Sadaoui: afficher le prix par carton}
//Eprixcarton.Text:= TArticleLocDAO.create.Prixcarton(oArticleDTO).ToString;
{fin}
oBarCodeWebDTO.DisposeOf;
oBarCodeWebDAO.DisposeOf;
oArticleDTO.DisposeOf;
end;

procedure TMRBonLiv.BrechArticleClick(Sender: TObject);
begin
oFArticle:=TFArticleWeb.Create(nil);
oFArticle.Parent:=Main.LayoutMAJAchat;
Main.TabControl1.ActiveTab:=Main.TMAJAchat;
oFArticle.BAjouter.Visible:=False;
oFArticle.BSupprimer.Visible:=False;
oFArticle.Bselect.Visible:=True;

end;

procedure TMRBonLiv.BScanClick(Sender: TObject);
begin
BarcodeScanner1.Scan;
end;

procedure TMRBonLiv.Button2Click(Sender: TObject);
begin
main.TabControl1.ActiveTab:=Main.TAchat;
Self.DisposeOf;
end;

procedure TMRBonLiv.BValidClick(Sender: TObject);
var oRbonlivWebDTO:TRBonLivWebDTO;
oRbonlivWebDAO:TRBonLivWebDAO;
//oBarCodeDTO:TbarCodeWebDTO;
//oBarCodeDAO:BarCodeDAO;
begin
oRbonlivWebDTO:=TRBonLivWebDTO.Create;
oRbonlivWebDAO:=TRBonLivWebDAO.Create;
oRbonlivWebDTO.idrbonliv:=oRbonlivWebDAO.getNewId;
oRbonlivWebDTO.idbonliv:=Main.oTFBonLiv.oSelectedbonlivDTO.idbonliv;
oRbonlivWebDTO.idbarCode:=EidBarCode.Text;
oRbonlivWebDTO.qtebonliv:=StrToFloat(EQteBonLiv.Text);
oRbonlivWebDTO.prixbonliv:=StrToFloat(ELastPrixAchat.Text);
oRbonlivWebDAO.save(oRbonlivWebDTO);
oRbonlivWebDTO.DisposeOf;

main.TabControl1.ActiveTab:=Main.TAchat;
Main.oTFBonLiv.AfficherDetail(Main.oTFBonLiv.SGDetail,Main.oTFBonLiv.oSelectedbonlivDTO,Main.oTFBonLiv.ETotal);
Self.DisposeOf;

end;

end.
