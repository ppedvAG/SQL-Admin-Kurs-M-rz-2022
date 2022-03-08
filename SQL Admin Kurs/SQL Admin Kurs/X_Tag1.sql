/*

Installation

DB Dateien
Pfade f�r DB Dateien  mdf und ldf
-->trenne die beiden voneinander
--lege entsprechend Ordner an

Security
Auth-Art ...gemischte  bzw NT 
bei gemischter Auth --> SA (Vollzugriff) --komplexes Kennwort
und wer ist SQL Admin aus Windows Benutzer und Gruppen
--sa ppedv2019!  ..gemischte Auth

Dienstkonten

virtuelle Dienstkonten , die selbst Kennwort�nderungen organsieren
lokale Konten
bei RemoteZugriff muss das Recht f�r den Computer vergeben 
NT Service\....

..Dienste: Agent (Jobs), DB Engine, Browser (UDP Port 1434), Volltextsuche

InstanzFeatureauswahl und Funktion
DB Engine (Replikation, Volltextsuche)
Clientkonnektivit�t

MAXDOP TEMPDB ARBEITSSPEICHER
..schl�gt best practice vor
--> max Arbeitsspeicher ..man muss empfohlenen Wert aktiv �bernehmen








--Auftrag f�r Volumemonitor per HTML Mails
*/


DECLARE @tableHTML  NVARCHAR(MAX) ;  
  
SET @tableHTML =  
    N'<H1>Volumemonitor </H1>' +  
    N'<table border="1">' +  
    N'<tr><th>Drive</th><th>Drive type</th>' +      N'<th>Available Space</th></tr>' +  
    CAST ( (  SELECT 
					td = fixed_drive_path,   '', 
					td=drive_type_desc,    '',
					td=CONVERT(DECIMAL(18,2), free_space_in_bytes/1073741824.0) 
					FROM sys.dm_os_enumerate_fixed_drives 
					FOR XML PATH('tr'), TYPE ) AS NVARCHAR(MAX) ) +      N'</table>' 
  
EXEC msdb.dbo.sp_send_dbmail @recipients='sql@sql.local',  @profile_name='SMTP_KAIRO',
    @subject = 'Volumemonitor',  
    @body = @tableHTML,  
    @body_format = 'HTML' ;  
  
  --Abfragen f�r DBMail

  select * from msdb.dbo.sysmail_profile
select * from msdb.dbo.sysmail_account

select * from msdb.dbo.sysmail_allitems
