program MobiMarket_1_3;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormatDateSQLiteU in 'ClassesUtils\FormatDateSQLiteU.pas',
  ArticleLocDTOU in 'Model\ArticleLocDTOU.pas',
  APIUtilsU in 'ClassesUtils\APIUtilsU.pas',
  ArticleWebDAOU in 'DAO\ArticleWebDAOU.pas',
  BarCodeWebDTOU in 'Model\BarCodeWebDTOU.pas',
  BarCodeWebDAOU in 'DAO\BarCodeWebDAOU.pas',
  ReqRecetteDTOU in 'Model\ReqRecetteDTOU.pas',
  ReqRecetteDAOU in 'DAO\ReqRecetteDAOU.pas',
  InventDTOU in 'Model\InventDTOU.pas',
  BonlivWebDAOU in 'DAO\BonlivWebDAOU.pas',
  RInventDTOU in 'Model\RInventDTOU.pas',
  RPreAchatLocDAOU in 'DAO\RPreAchatLocDAOU.pas',
  UConnection in 'ClassesUtils\UConnection.pas' {Connection: TDataModule},
  ArticleWebDTOU in 'Model\ArticleWebDTOU.pas',
  ArticleLocDAOU in 'DAO\ArticleLocDAOU.pas',
  FArticleLocU in 'View\FArticleLocU.pas' {FArticleLoc: TFrame},
  FFourWebU in 'View\FFourWebU.pas' {FFourWeb: TFrame},
  FPreAchatU in 'View\FPreAchatU.pas' {FPreAchat: TFrame},
  FRecetteU in 'View\FRecetteU.pas' {FRecette: TFrame},
  MainU in 'View\MainU.pas' {Main},
  MBarCodeWebU in 'View\MBarCodeWebU.pas' {MBarCodeWeb: TFrame},
  BarCodeLocDAOU in 'DAO\BarCodeLocDAOU.pas',
  MBarCodeLocU in 'View\MBarCodeLocU.pas' {MBarCodeLoc: TFrame},
  MPreAchatU in 'View\MPreAchatU.pas' {MPreAchat: TFrame},
  BarCodeLocDTOU in 'Model\BarCodeLocDTOU.pas',
  FInventU in 'View\FInventU.pas' {FInvent: TFrame},
  PreAchatLocDTOU in 'Model\PreAchatLocDTOU.pas',
  RPreAchatLocDTOU in 'Model\RPreAchatLocDTOU.pas',
  MInventU in 'View\MInventU.pas' {MInvent: TFrame},
  PreAchatLocDAOU in 'DAO\PreAchatLocDAOU.pas',
  StringUtilsU in 'ClassesUtils\StringUtilsU.pas',
  MRInventU in 'View\MRInventU.pas' {MRInvent: TFrame},
  RBonLivWabDAOU in 'DAO\RBonLivWabDAOU.pas',
  FBonLivraisonU in 'View\FBonLivraisonU.pas' {FBonLivraison: TFrame},
  BonLivWebDTOU in 'Model\BonLivWebDTOU.pas',
  RBonLivWebDTOU in 'Model\RBonLivWebDTOU.pas',
  InventDAOU in 'DAO\InventDAOU.pas',
  RInventDAOU in 'DAO\RInventDAOU.pas',
  FourWebDTOU in 'Model\FourWebDTOU.pas',
  MBonLivU in 'View\MBonLivU.pas' {MBonLiv: TFrame},
  FArticleWebU in 'View\FArticleWebU.pas' {FArticleWeb: TFrame},
  FourWebDAOU in 'DAO\FourWebDAOU.pas',
  MRPreAchatU in 'View\MRPreAchatU.pas' {MRPreAchat: TFrame},
  MRBonLivU in 'View\MRBonLivU.pas' {MRBonLiv: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TConnection, Connection);
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
