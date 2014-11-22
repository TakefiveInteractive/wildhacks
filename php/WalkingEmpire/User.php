<?php

include_once 'database/sqlutils.php';

class User {
	private $sql;
	
	private $userid;
	private $cookie;
	
	static function findUserIdByCookie($cookie) {
		$sql = new SQLUtils();
		$result = $sql->select("userid", "users", "cookie", $cookie);
		if ($result === false)
			return false;
		
		
		return $result['userid'];
	}
	
	static function findFacebookIdByCookie($cookie) {
		$sql = new SQLUtils();
		$result = $sql->select("facebookid", "users", "cookie", $cookie);
		if ($result === false)
			return false;
		
		return $result['facebookid'];
	}
	
	function __construct($cookie) {
		$this->sql = new SQLUtils();
		$this->cookie = $cookie;
	}
	
	function getUsername() {
		// Get username
		$usernameResult = User::findUserIdByCookie($cookie);
		if ($usernameResult === false)
			$this->userid = $usernameResult;
		
		return $this->userid;
	}
	
	function setLocation($longitude, $latitude) {
		$eqivalenceStr = sprintf("`longitude` = %f, `latitude` = %f", $longitude, $latitude);
		$result = $this->sql->update("users", $equivalenceStr, "cookie", $cookie);
		if (result === false)
			return false;
		else
			return true;
	}
	
	function setCookie($cookie) {
		$eqivalenceStr = sprintf("`cookie` = '%s'", $cookie);
		$result = $this->sql->update("users", $equivalenceStr, "cookie", $this->cookie);
		if (result === false)
			return false;
		else {
			$this->cookie = $cookie;
			return true;
		}
	}
	
	function setToken($token) {
		$eqivalenceStr = sprintf("`token` = '%s'", $token);
		$result = $this->sql->update("users", $equivalenceStr, "cookie", $this->cookie);
		if (result === false)
			return false;
		else
			return true;
	}
	
	function getCookies() {
		
	}
	
	function getToken() {
		
	}
	
	function getRow() {
		
	}
}

?>