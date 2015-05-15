function FigureWhite()
figure(gcf)
% opis tekstowy  osi
set(gcf,'Color','white') % szare t³o
%set(gcf,'PaperOrientation', 'portrait')
%set(gcf,'PaperOrientation', 'portrait')
set(gcf,'PaperUnits', 'centimeters')
%set(gcf,'PaperPosition', [3.0404 10.6282 14.8847 8.4338])
set(gcf,'Units', 'centimeters')
%set(gcf,'Position', [16.5768 9.38557 14.8847 8.4338])
 set(gca,'Color','white')
 set(gca,'XColor','black')
 set(gca,'YColor','black')
 set(gca,'ZColor','black')
%set(gca,'FontName','Arial')
  set(gca,'FontName','Times New Roman')
  set(gca,'FontAngle','normal')
  set(gca,'FontWeight','normal')
  set(gca,'FontSize',12)
  set(gca,'LineWidth',1.5)
% opis tekstowy 
   set(gca,'DefaultTextColor','black')
   set(gca,'DefaultTextFontName','Times New Roman')
   set(gca,'DefaultTextFontAngle','normal')
   set(gca,'DefaultTextFontWeight','bold')
   set(gca,'DefaultTextFontSize',12)
set(gca, 'TickDir'     , 'out' );
set(gca, 'TickLength'  , [.02 .02]);
set(gca, 'XMinorTick'  , 'on' );
set(gca, 'YMinorTick'  , 'on' );
set(gca, 'Box'         , 'off'  );
%set(gca, 'YTick'       , '[]' );
set(gcf, 'PaperPositionMode', 'auto');
end
