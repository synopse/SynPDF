program drawrotated;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  windows,
  SysUtils,
  synpdf,
  SynPdfMatrixHelper in '..\..\..\SynPdfMatrixHelper.pas',
  Graphics;

{ Will create a PdfPage with 3 different emfFiles on it
  -  We have 3 Emf in landscape A4
  -  The first will be printed on the bottom of the page Scaled to fit the width
  -  the Second on the left side Top rotated 90 Degrees
  -  the third on the rightside Top rotated 270 Degrees
  }




 procedure CreateTestPdf;
 var PdfDoc : TPdfDocumentGDI;
     lXform : XFORM;
     lScale, lRotate, lTranslate : XFORM;
     metafile : TMetafile;
     filepath : String;
     filename : String;
     lX : integer;
     lY : integer;
 begin
   PdfDoc := TPdfDocumentGDI.Create;
   PdfDoc.DefaultPaperSize := psA4;
   PdfDoc.ScreenLogPixels := 96; // Map to PDF Pixels
   // We have 3 Emf in landscape A4
   PdfDoc.AddPage;
   filepath := ExtractFilePath(paramstr(0));
   filename := filepath + 'Data\test1.emf';
   metafile := TMetafile.create;
   metafile.LoadFromFile(Filename);

   // Scale and move
   lxform :=  getCombinedXform(getScaleXform(210/297, 210/297), getTranslationXform(0, MulDiv(PdfDoc.DefaultPageHeight div 2, 96, 72)));
   GDICommentPushXForm(PdfDoc.VCLCanvas.Handle, lxform);
   pdfdoc.VCLCanvas.draw(0,0, metafile);
   pdfdoc.VCLCanvas.pen.color := clred;
   pdfdoc.VCLCanvas.Brush.color := clLtGray;
   pdfdoc.VCLCanvas. Ellipse(10, 10, 100, 100);


   GDICommentPopXForm(PdfDoc.VCLCanvas.Handle);
   metafile.free;

   // File 2
    metafile := TMetafile.create;
   filename := filepath + 'Data\test2.emf';
   metafile.LoadFromFile(Filename);

   // Scale move and Rotate
   lx := MulDiv(PdfDoc.DefaultPageWidth div 2, 96, 72);
   Ly := MulDiv(PdfDoc.DefaultPageHeight div 2, 96, 72);

   lTranslate := getTranslationXform(lX, lY);
   lRotate := getRotationDegXform(90);
   lScale := getScaleXform(0.5, 0.5);

   lxform :=  getCombinedXform(lScale, lTranslate);
   lxform := getCombinedXform(lRotate, lXform);

   GDICommentPushXForm(PdfDoc.VCLCanvas.Handle, lxform);
   pdfdoc.VCLCanvas.draw(0,0, metafile);
   pdfdoc.VCLCanvas.pen.color := clred;
   pdfdoc.VCLCanvas.Brush.color := clSkyBlue;
   pdfdoc.VCLCanvas. Ellipse(10, 10, 100, 100);

   GDICommentPopXForm(PdfDoc.VCLCanvas.Handle);
   metafile.free;

     // File 3
    metafile := TMetafile.create;
   filename := filepath + 'Data\test3.emf';
   metafile.LoadFromFile(Filename);

   // Scale move and Rotate
   lx := MulDiv(PdfDoc.DefaultPageWidth div 2, 96, 72);
   Ly := 0; //MulDiv(PdfDoc.DefaultPageHeight div 2, 96, 72);

   lTranslate := getTranslationXform(lX, lY);
   lRotate := getRotationDegXform(270);
   lScale := getScaleXform(0.5, 0.5);

   lxform :=  getCombinedXform(lScale, lTranslate);
   lxform := getCombinedXform(lRotate, lXform);

   GDICommentPushXForm(PdfDoc.VCLCanvas.Handle, lxform);
   pdfdoc.VCLCanvas.draw(0,0, metafile);
   pdfdoc.VCLCanvas.pen.color := clred;
   pdfdoc.VCLCanvas.Brush.color := clYellow;
   pdfdoc.VCLCanvas. Ellipse(10, 10, 100, 100);

   GDICommentPopXForm(PdfDoc.VCLCanvas.Handle);
   metafile.free;


   // Write out PDF
   filename := filepath + 'Data\Testresult.pdf';
   if fileexists(filename) then deletefile(filename);
   PdfDoc.SaveToFile(Filename);
 end;


begin
  try
   createTestPdf;
  except
    on E: Exception do
     begin
      Writeln(E.ClassName, ': ', E.Message);
       readln;
     end;
  end;

end.
