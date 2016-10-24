unit SynPdfMatrixHelper;

interface

uses
   Windows;

function getDefaultXform: XFORM;
function getTranslationXform(adx, ady: single): XFORM;
function getScaleXform(aScaleX, aScaleY: single): XFORM;
function getRotationDegXform(aDegree: single): XFORM;
function getRotationRadXform(aRadian: single): XFORM;
function getCombinedXform(aleft, aright: XFORM): XFORM;

implementation

function DegToRad(const Degrees: Single): Single;  { Radians := Degrees * PI / 180 }
begin
  Result := Degrees * (PI / 180);
end;



function getDefaultXform: XFORM;
begin
   fillchar(result, sizeof(result), 0);
   result.eM11 := 1;
   result.eM22 := 1;
end;

function getTranslationXform(adx, ady: single): XFORM;
begin
   result := getDefaultXform;
   result.eDx := adx;
   result.eDy := ady;
end;

function getScaleXform(aScaleX, aScaleY: single): XFORM;
begin
   result := getDefaultXform;
   result.eM11 := aScaleX;
   result.eM22 := aScaleY;
end;


function getRotationRadXform(aRadian: single): XFORM;
var lcos, lsin : single;
begin
  result := getDefaultXform;
  lcos := cos(aRadian);
  lsin := Sin(aRadian);
  result.eM11 := lcos;
  result.eM12 := lsin;
  result.eM21 := -lsin;
  result.eM22 := lcos;
end;

function getRotationDegXform(aDegree: single): XFORM;
begin
  result := getRotationRadXform(degToRad(aDegree));
end;


function getCombinedXform(aleft, aright: XFORM): XFORM;
begin
 if not CombineTransform(result, aleft, aright) then
  result := getDefaultXform;
end;


end.
