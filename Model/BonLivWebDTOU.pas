unit BonLivWebDTOU;

interface
Type TBonLivWebDTO=class(TObject)
  private
    Fdesbonliv: string;
    Fidfour: Integer;
    Fdate_: string;
    Fidbonliv: Integer;
    procedure Setdate_(const Value: string);
    procedure Setdesbonliv(const Value: string);
    procedure Setidbonliv(const Value: Integer);
    procedure Setidfour(const Value: Integer);
  public
   property date_: string read Fdate_ write Setdate_;
   property idbonliv:Integer read Fidbonliv write Setidbonliv;
   property desbonliv: string read Fdesbonliv write Setdesbonliv;
   property idfour:Integer read Fidfour write Setidfour;

end;
implementation

{ TBonLivWebDTO }

procedure TBonLivWebDTO.Setdate_(const Value: string);
begin
  Fdate_ := Value;
end;

procedure TBonLivWebDTO.Setdesbonliv(const Value: string);
begin
  Fdesbonliv := Value;
end;

procedure TBonLivWebDTO.Setidbonliv(const Value: Integer);
begin
  Fidbonliv := Value;
end;

procedure TBonLivWebDTO.Setidfour(const Value: Integer);
begin
  Fidfour := Value;
end;

end.
