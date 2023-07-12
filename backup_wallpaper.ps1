# Note: if scheduling this script, you may need to check 
# that the powershell session is logged in as the user

$ImageURL = "https://i.pinimg.com/originals/e1/2e/4d/e12e4dd11ee3a78caf03ea0b10943b10.jpg"

$path = "C:\xampp\code\wallpaper.jpg"

Invoke-WebRequest -Uri $ImageURL -OutFile $path

$setwallpapersrc = @"
using System.Runtime.InteropServices;

public class Wallpaper
{
  public const int SetDesktopWallpaper = 20;
  public const int UpdateIniFile = 0x01;
  public const int SendWinIniChange = 0x02;
  [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
  private static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
  public static void SetWallpaper(string path)
  {
    SystemParametersInfo(SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange);
  }
}
"@
Add-Type -TypeDefinition $setwallpapersrc

[Wallpaper]::SetWallpaper($path)

Remove-Item -Path $path