unit RBonLivWebDTOU;

interface
TYPE
TRBonLivWebDTO=class(TObject)
  private
    Fprixbonliv: Double;
    Fqtebonliv: Double;
    Fidrbonliv: Integer;
    Fidbarcode: string;
    Fidbonliv: Integer;
    procedure Setidbarcode(const Value: string);
    procedure Setidbonliv(const Value: Integer);
    procedure Setidrbonliv(const Value: Integer);
    procedure Setprixbonliv(const Value: Double);
    procedure Setqtebonliv(const Value: Double);
  public

  property idrbonliv: Integer read Fidrbonliv write Setidrbonliv;
  property idbonliv:Integer read Fidbonliv write Setidbonliv;
  property idbarcode: string read Fidbarcode write Setidbarcode;
  property qtebonliv:Double read Fqtebonliv write Setqtebonliv;
  property prixbonliv:Double read Fprixbonliv write Setprixbonliv;
end;

implementation

{ TRBonLivWebDTO }

procedure TRBonLivWebDTO.Setidbarcode(const Value: string);
begin
  Fidbarcode := Value;
end;

procedure TRBonLivWebDTO.Setidbonliv(const Value: Integer);
begin
  Fidbonliv := Value;
end;

procedure TRBonLivWebDTO.Setidrbonliv(const Value: Integer);
begin
  Fidrbonliv := Value;
end;

procedure TRBonLivWebDTO.Setprixbonliv(const Value: Double);
begin
  Fprixbonliv := Value;
end;

procedure TRBonLivWebDTO.Setqtebonliv(const Value: Double);
begin
  Fqtebonliv := Value;
end;

end.
