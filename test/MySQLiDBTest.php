<?php

require_once dirname(__FILE__) . '/../MySQLiDB.inc.php';
require_once dirname(__FILE__) . '/../srer/sql.defs.php';

/**
 * Test class for MySQLiDB.
 * Generated by PHPUnit on 2013-07-13 at 15:39:19.
 */
class MySQLiDBTest extends PHPUnit_Framework_TestCase {

  /**
   * @var MySQLiDB
   */
  protected $object;

  /**
   * Sets up the fixture, for example, opens a network connection.
   * This method is called before a test is executed.
   */
  protected function setUp() {
    $this->object = new MySQLiDB;
    CreateSchemas();
  }

  /**
   * Tears down the fixture, for example, closes a network connection.
   * This method is called after a test is executed.
   */
  protected function tearDown() {

  }

  /**
   * @covers MySQLiDB::__get
   * @todo Implement test__get().
   */
  public function test__get() {
    // Remove the following lines when you implement this test.
    $this->markTestIncomplete(
            'This test has not been implemented yet.'
    );
  }

  /**
   * @covers MySQLiDB::__set
   * @todo Implement test__set().
   */
  public function test__set() {
    // Remove the following lines when you implement this test.
    $this->markTestIncomplete(
            'This test has not been implemented yet.'
    );
  }

  /**
   * @covers MySQLiDB::__sleep
   * @todo Implement test__sleep().
   */
  public function test__sleep() {
    // Remove the following lines when you implement this test.
    $this->markTestIncomplete(
            'This test has not been implemented yet.'
    );
  }

  /**
   * @covers MySQLiDB::__wakeup
   * @todo Implement test__wakeup().
   */
  public function test__wakeup() {
    // Remove the following lines when you implement this test.
    $this->markTestIncomplete(
            'This test has not been implemented yet.'
    );
  }

  /**
   * @covers MySQLiDB::SqlSafe
   */
  public function testSqlSafe() {
    $this->assertEquals($this->object->SqlSafe("va'lue"), "va\'lue");
    $this->assertEquals($this->object->SqlSafe('va"lue'), 'va\"lue');
  }

  /**
   * @covers MySQLiDB::do_max_query
   */
  public function testDo_max_query() {
    // Remove the following lines when you implement this test.
    $this->assertEquals($this->object->do_max_query("Select 3+4;"), 7);
    $this->assertEquals($this->object->do_max_query("Select NULL;"), 0);
  }

  /**
   * @covers MySQLiDB::do_ins_query
   * @todo Implement testDo_ins_query().
   */
  public function testDo_ins_query() {
    $Query = "CREATE TEMPORARY TABLE `test_MySQLiDB`( val Int Not Null );";
    $this->assertEquals($this->object->do_ins_query($Query), 0);

    /* Add all the values in the range to the temp table. */
    $Query = "INSERT INTO `test_MySQLiDB` VALUES (1),(2),(3),(4),(5),(6);";
    $this->assertEquals($this->object->do_ins_query($Query), 6);

    /* Free resources. This isnt needed, technically, unless
     * you plan on using the function multiple times per connection */
    $Query = "DROP TABLE `test_MySQLiDB`;";
    $this->assertEquals($this->object->do_ins_query($Query), 0);
  }

  /**
   * @covers MySQLiDB::do_sel_query
   */
  public function testDo_sel_query() {
    $Query = "Select 1,2,3,4,4+5;";
    $this->assertEquals($this->object->do_sel_query($Query), 1);
    $Row = $this->object->get_row();
    $this->assertEquals($Row['4+5'], 9);
    $Query = "CREATE TEMPORARY TABLE `test_MySQLiDB`( val Int Not Null );";
    $this->object->do_ins_query($Query);

    /* Add all the values in the range to the temp table. */
    $Query = "INSERT INTO `test_MySQLiDB` VALUES (1),(2),(3),(4),(5),(6);";
    $this->object->do_ins_query($Query);
    $Query = "Select * FROM `test_MySQLiDB`;";
    $this->assertEquals($this->object->do_sel_query($Query), 6);
    $Query = "Select * FROM `test_MySQLiDB9`;";
    $this->assertEquals($this->object->do_sel_query($Query), 0);
    /* Free resources. This isnt needed, technically, unless
     * you plan on using the function multiple times per connection */
    $Query = "DROP TABLE `test_MySQLiDB`;";
    $this->object->do_ins_query($Query);
  }

  /**
   * @covers MySQLiDB::get_row
   */
  public function testGet_row() {
    $Query = "Select 1,2,3,4,4+5;";
    $this->assertEquals($this->object->do_sel_query($Query), 1);
    $Row = $this->object->get_row();
    $this->assertEquals($Row['4+5'], 9);
  }

  /**
   * @covers MySQLiDB::get_n_row
   */
  public function testGet_n_row() {
    $Query = "Select 1,2,3,4,4+5;";
    $this->assertEquals($this->object->do_sel_query($Query), 1);
    $Row = $this->object->get_n_row();
    $this->assertEquals($Row[4], 9);
  }

  /**
   * @covers MySQLiDB::GetFieldName
   */
  public function testGetFieldName() {
    $Query = "CREATE TEMPORARY TABLE `test_MySQLiDB`( val Int Not Null );";
    $this->object->do_ins_query($Query);

    /* Add all the values in the range to the temp table. */
    $Query = "INSERT INTO `test_MySQLiDB` VALUES (1),(2),(3),(4),(5),(6);";
    $this->object->do_ins_query($Query);
    $Query = "Select * FROM `test_MySQLiDB`;";
    $this->object->do_sel_query($Query);
    $this->assertEquals($this->object->GetFieldName(0), 'val');
    $this->assertEquals($this->object->GetFieldName(1), "Offset Error!");
    $Query = "Select * FROM `test_MySQLiDB9`;";
    $this->object->do_sel_query($Query);
    $this->assertEquals($this->object->GetFieldName(0), "ERROR!");
    /* Free resources. This isnt needed, technically, unless
     * you plan on using the function multiple times per connection */
    $Query = "DROP TABLE `test_MySQLiDB`;";
    $this->object->do_ins_query($Query);
  }

  /**
   * @covers MySQLiDB::GetTableName
   */
  public function testGetTableName() {
    $Query = "CREATE TEMPORARY TABLE `test_MySQLiDB`( val Int Not Null );";
    $this->object->do_ins_query($Query);

    /* Add all the values in the range to the temp table. */
    $Query = "INSERT INTO `test_MySQLiDB` VALUES (1),(2),(3),(4),(5),(6);";
    $this->object->do_ins_query($Query);
    $Query = "Select * FROM `test_MySQLiDB`;";
    $this->object->do_sel_query($Query);
    $this->assertEquals($this->object->GetTableName(0), 'test_MySQLiDB');
    $this->assertEquals($this->object->GetTableName(1), "Offset Error!");
    $Query = "Select * FROM `test_MySQLiDB9`;";
    $this->object->do_sel_query($Query);
    $this->assertEquals($this->object->GetTableName(0), "ERROR!");
    /* Free resources. This isnt needed, technically, unless
     * you plan on using the function multiple times per connection */
    $Query = "DROP TABLE `test_MySQLiDB`;";
    $this->object->do_ins_query($Query);
  }

  /**
   * @covers MySQLiDB::GetCaption
   */
  public function testGetCaption() {
    $this->assertEquals($this->object->GetCaption('UserName'), 'Block');
    $this->assertEquals($this->object->GetCaption('NotAvailable'), 'NotAvailable');
  }

  /**
   * @covers MySQLiDB::show_sel
   * @todo Implement testShow_sel().
   */
  public function testShow_sel() {
    // Remove the following lines when you implement this test.
    $this->markTestIncomplete(
            'This test has not been implemented yet.'
    );
  }

  /**
   * @covers MySQLiDB::ShowTable
   * @todo Implement testShowTable().
   */
  public function testShowTable() {
    // Remove the following lines when you implement this test.
    $this->markTestIncomplete(
            'This test has not been implemented yet.'
    );
  }

  /**
   * @covers MySQLiDB::ShowTableKiosk
   * @todo Implement testShowTableKiosk().
   */
  public function testShowTableKiosk() {
    // Remove the following lines when you implement this test.
    $this->markTestIncomplete(
            'This test has not been implemented yet.'
    );
  }

  /**
   * @covers MySQLiDB::do_close
   * @todo Implement testDo_close().
   */
  public function testDo_close() {
    // Remove the following lines when you implement this test.
    $this->markTestIncomplete(
            'This test has not been implemented yet.'
    );
  }

}

?>
