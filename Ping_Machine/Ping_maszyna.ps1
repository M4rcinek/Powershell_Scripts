Add-Type -assembly System.Windows.Forms
Add-Type -AssemblyName PresentationFramework
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='PING-MASZYNA!'
$main_form.Width = 600
$main_form.Height = 400
$main_form.AutoSize = $true
$main_form.StartPosition = 'CenterScreen'

$Tytul = New-Object System.Windows.Forms.Label
$Tytul.Text = "Wybierz Co chcesz Spingować!"
$Tytul.Location  = New-Object System.Drawing.Point(100,10)
$Tytul.AutoSize = $true
$Tytul.Font = New-Object System.Drawing.Font("Agency FB",18,[System.Drawing.FontStyle]::Bold)

$od_kamer = New-Object System.Windows.Forms.Label
$od_kamer.Text = "Kamery"
$od_kamer.Location  = New-Object System.Drawing.Point(250,70)
$od_kamer.AutoSize = $true
$od_kamer.Font = New-Object System.Drawing.Font("Agency FB",10)

$kamery = new-object windows.forms.button
$kamery.text = "Pinguj kamery"
$kamery.Size = New-Object System.Drawing.Size(75,75)
$kamery.Location = New-Object System.Drawing.Point(232,90)
$kamery.AutoSize = $true
$kamery.add_Click({
    $kamery_form = New-Object System.Windows.Forms.Form
    $kamery_form.Text = "Kamery"
    $kamery_form.Size = New-Object System.Drawing.Size(1440,900)
    Set-Location C:\Users\$Env:Username\Documents\PS2_Ping
    $data = Get-Content "Example_Cameras.txt"
    $j=0
    $addr = @()
    $names = @()
    $labels = @()
    for($i = 0;$i -lt $data.Length;$i++)
    {
        if($i % 2 -eq 0)
        {
            $addr+=$data[$i]
        }
        else
        {
            $names+=$data[$i]
        }
        $j++
    }
    $w=10
    $z=0
    for($k=0;$k -lt $addr.Length;$k++)
    {
        $ping = New-Object System.Net.NetworkInformation.Ping
        if($z * 25 -gt 800){$z=0; $w+=500} 
        if($ping.Send($addr[$k],5000).Status -eq "success")
        {
            $label = new-object System.Windows.Forms.Label;
            $label.Location = new-object System.Drawing.Point($w, ($z * 25));
            $label.Text = $names[$k]
            $label.AutoSize = $true
            $labels += $label;
            $kamery_form.Controls.Add($label)
            
            $label1 = new-object System.Windows.Forms.Label;
            $label1.Location = new-object System.Drawing.Point((290+$w), ($z * 25));
            $label1.Text = "Success"
            $label1.ForeColor = "Green"
            $label1.AutoSize = $true
            $labels += $label1;
            $kamery_form.Controls.Add($label1)
        }
        else
        {
            $label = new-object System.Windows.Forms.Label;
            $label.Location = new-object System.Drawing.Point($w, ($z * 25));
            $label.Text = $names[$k]
            $label.AutoSize = $true
            $labels += $label;
            $kamery_form.Controls.Add($label)

            $label1 = new-object System.Windows.Forms.Label;
            $label1.Location = new-object System.Drawing.Point((290+$w), ($z * 25));
            $label1.Text = "Error"
            $label1.ForeColor = "Red"
            $label1.AutoSize = $true
            $labels += $label1;
            $kamery_form.Controls.Add($label1)
        }
        $z++
    }
$kamery_form.ShowDialog()})


$od_acc = New-Object System.Windows.Forms.Label
$od_acc.Text = "Terminale Accard"
$od_acc.Location  = New-Object System.Drawing.Point(222,170)
$od_acc.AutoSize = $true
$od_acc.Font = New-Object System.Drawing.Font("Agency FB",10)

$acc = new-object windows.forms.button
$acc.text = "Pinguj Terminale"
$acc.Size = New-Object System.Drawing.Size(75,75)
$acc.Location = New-Object System.Drawing.Point(225,190)
$acc.AutoSize = $true
$acc.add_Click({
    $acc_form = New-Object System.Windows.Forms.Form
    $acc_form.Text = "Kamery"
    $acc_form.Size = New-Object System.Drawing.Size(1440,900)
    Set-Location C:\Users\$Env:Username\Documents\PS2_Ping
    $data = Get-Content "Example_Terminals.txt"
    $j=0
    $addr = @()
    $names = @()
    $labels = @()
    for($i = 0;$i -lt $data.Length;$i++)
    {
        if($i % 2 -eq 0)
        {
            $addr+=$data[$i]
        }
        else
        {
            $names+=$data[$i]
        }
        $j++
    }
    $w=10
    $z=0
    for($k=0;$k -lt $addr.Length;$k++)
    {
        $ping = New-Object System.Net.NetworkInformation.Ping
        if($z * 25 -gt 800){$z=0; $w+=500} 
        if($ping.Send($addr[$k],5000).Status -eq "success")
        {
            $label = new-object System.Windows.Forms.Label;
            $label.Location = new-object System.Drawing.Point($w, ($z * 25));
            $label.Text = $names[$k]
            $label.AutoSize = $true
            $labels += $label;
            $acc_form.Controls.Add($label)
            
            $label1 = new-object System.Windows.Forms.Label;
            $label1.Location = new-object System.Drawing.Point((290+$w), ($z * 25));
            $label1.Text = "Success"
            $label1.ForeColor = "Green"
            $label1.AutoSize = $true
            $labels += $label1;
            $acc_form.Controls.Add($label1)
        }
        else
        {
            $label = new-object System.Windows.Forms.Label;
            $label.Location = new-object System.Drawing.Point($w, ($z * 25));
            $label.Text = $names[$k]
            $label.AutoSize = $true
            $labels += $label;
            $acc_form.Controls.Add($label)

            $label1 = new-object System.Windows.Forms.Label;
            $label1.Location = new-object System.Drawing.Point((290+$w), ($z * 25));
            $label1.Text = "Error"
            $label1.ForeColor = "Red"
            $label1.AutoSize = $true
            $labels += $label1;
            $acc_form.Controls.Add($label1)
        }
        $z++
    }
$acc_form.ShowDialog()})

$od_inne = New-Object System.Windows.Forms.Label
$od_inne.Text = "Adres IP"
$od_inne.Location  = New-Object System.Drawing.Point(250,270)
$od_inne.AutoSize = $true
$od_inne.Font = New-Object System.Drawing.Font("Agency FB",10)


$adres1 = New-Object System.Windows.Forms.TextBox
$adres1.Size = New-Object System.Drawing.Size(30,30)
$adres1.Location  = New-Object System.Drawing.Point(200,300)
$adres1.MaxLength=3
$adres2 = New-Object System.Windows.Forms.TextBox
$adres2.Size = New-Object System.Drawing.Size(30,30)
$adres2.Location  = New-Object System.Drawing.Point(240,300)
$adres2.MaxLength=3
$adres3 = New-Object System.Windows.Forms.TextBox
$adres3.Size = New-Object System.Drawing.Size(30,30)
$adres3.Location  = New-Object System.Drawing.Point(280,300)
$adres3.MaxLength=3
$adres4 = New-Object System.Windows.Forms.TextBox
$adres4.Size = New-Object System.Drawing.Size(30,30)
$adres4.Location  = New-Object System.Drawing.Point(320,300)
$adres4.MaxLength=3

$inne = new-object windows.forms.button
$inne.text = "Pinguj"
$inne.Location = New-Object System.Drawing.Point(240,330)
$inne.AutoSize = $true
$inne.add_Click({
        if(($adres1.Text -match "^\d+$" -eq "True") -and ($adres2.Text -match "^\d+$" -eq "True") -and ($adres4.Text -match "^\d+$" -eq "True") -and ($adres3.Text -match "^\d+$" -eq "True"))
        {
            if(([int]$adres1.Text -gt 0 -and [int]$adres1.Text -lt 255) -and ([int]$adres2.Text -gt 0 -and [int]$adres2.Text -lt 255) -and ([int]$adres3.Text -gt 0 -and [int]$adres3.Text -lt 255) -and ([int]$adres4.Text -gt 0 -and [int]$adres4.Text -lt 255))
            {
                $ip=$adres1.Text + "." + $adres2.Text + "." + $adres3.Text + "." + $adres4.Text
                $ping = New-Object System.Net.NetworkInformation.Ping
                if($ping.Send($ip,5000).Status -eq "success")
                {
                    [System.Windows.MessageBox]::Show("Success!")
                }
                else
                {
                    [System.Windows.MessageBox]::Show("Error!")
                }
            }
            else
            {
                [System.Windows.MessageBox]::Show("Podaj prawidłowy adres!")
            }
        }
        else
        {
            [System.Windows.MessageBox]::Show("Podaj prawidłowy adres!")
        }
})

$main_form.Controls.Add($Tytul)
$main_form.Controls.Add($od_kamer)
$main_form.Controls.Add($kamery)
$main_form.Controls.Add($od_acc)
$main_form.Controls.Add($acc)
$main_form.Controls.Add($od_inne)
$main_form.Controls.Add($inne)
$main_form.Controls.Add($adres1)
$main_form.Controls.Add($adres2)
$main_form.Controls.Add($adres3)
$main_form.Controls.Add($adres4)


$main_form.ShowDialog()