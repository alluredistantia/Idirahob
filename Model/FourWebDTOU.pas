unit FourWebDTOU;

interface
type TFourWebDTO=class
  private
    Ftel: string;
    Fidfour: Integer;
    Fdesfour: string;
    procedure Setdesfour(const Value: string);
    procedure Setidfour(const Value: Integer);
    procedure Settel(const Value: string);
  public
 property idfour:Integer read Fidfour write Setidfour;
 property desfour: string read Fdesfour write Setdesfour;
 property tel:string read Ftel write Settel;
 constructor create (id:Integer);

end;

implementation

{ TFourWebDTO }

constructor TFourWebDTO.create(id: Integer);
begin
self.idfour:=id;
end;

procedure TFourWebDTO.Setdesfour(const Value: string);
begin
  Fdesfour := Value;
end;

procedure TFourWebDTO.Setidfour(const Value: Integer);
begin
  Fidfour := Value;
end;

procedure TFourWebDTO.Settel(const Value: string);
begin
  Ftel := Value;
end;

end.
