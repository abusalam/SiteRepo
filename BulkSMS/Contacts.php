<?php
require_once __DIR__ . '/../lib.inc.php';

WebLib::AuthSession();
WebLib::Html5Header('Manage Contacts');
WebLib::IncludeCSS();
WebLib::IncludeCSS('css/forms.css');
WebLib::JQueryInclude();
WebLib::IncludeJS('BulkSMS/js/Compose.js');
?>
</head>
<body>
<div class="TopPanel">
  <div class="LeftPanelSide"></div>
  <div class="RightPanelSide"></div>
  <h1><?php echo AppTitle; ?></h1>
</div>
<div class="Header"></div>
<?php
WebLib::ShowMenuBar('SMS');
?>
<div class="content">
<span class="Message" id="Msg" style="float: right;">
      <b>Loading please wait...</b>
    </span>
  <div class="formWrapper">
    <form method="post" enctype="multipart/form-data"
          action="<?php
          echo WebLib::GetVal($_SERVER, 'PHP_SELF');
          ?>">
      <h3 class="formWrapper-h3">Manage Contacts</h3>
      <div class="FieldGroup">
        <label for="UserID"><strong>SMS Group:</strong></label><br/>
        <select id="UserID" name="GroupID">
          <option></option>
          <?php
          $DB = new MySQLiDBHelper();
          $Groups = $DB->get(MySQL_Pre . 'SMS_Groups');
          foreach ($Groups as $Group) {
            echo '<option value="' . $Group['GroupID'] . '">'
              . $Group['GroupID'] . ' - ' . $Group['GroupName'] . '</option>';
          } ?>
        </select><input type="submit" name="CmdRefresh" value="Filter By Group"/>
      </div>
      <div class="FieldGroup">
        <label for="UserID"><strong>Mobile No:</strong></label><br/>
        <input type="text" maxlength="10" name="MobileNo"/>
        <input type="submit" name="CmdRefresh" value="Filter By Mobile No"/>
      </div>
      <div class="formWrapper-Clear"></div>
        <div style="margin:5px;">
          <div id="DataTable">
            <?php
            $DB = new MySQLiDBHelper();
            $GroupID=WebLib::GetVal($_POST,"GroupID",true);
            $MobileNo=WebLib::GetVal($_POST,"MobileNo",true);
            if($GroupID>0){
              $DB->where("GroupID", $GroupID);
            } else {
              $DB->where("MobileNo", $MobileNo);
            }
            WebLib::ShowTable($DB->query('Select * '
              . 'from ' . MySQL_Pre . 'SMS_GroupWiseContacts'));
            unset($DB);
            ?>
          </div>
        </div>
    </form>
  </div>
  <pre id="Error"></pre>
</div>
<div class="pageinfo">
  <?php WebLib::PageInfo(); ?>
</div>
<div class="footer">
  <?php WebLib::FooterInfo(); ?>
</div>
</body>
</html>