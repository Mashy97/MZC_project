-- 회원 가입
DELIMITER //
CREATE PROCEDURE sp_user_insert
(
	IN	v_id		VARCHAR(30),
	IN	v_pwd		VARCHAR(30),
	IN	v_name		VARCHAR(20),
	IN	v_email		VARCHAR(50),
	IN	v_nickname	VARCHAR(50),
	IN	v_type		CHAR(1)
)
BEGIN
	INSERT INTO user(u_id, u_pwd, u_name, u_email, u_nickname, u_type)
    VALUES(v_id, v_pwd, v_name, v_email, v_nickname, v_type);
	COMMIT;
END //
DELIMITER ;

		
-- 로그인
DELIMITER //
CREATE PROCEDURE sp_user_login
(
	IN	v_id	VARCHAR(30),
	OUT v_pwd	VARCHAR(30)
)
BEGIN
	SELECT u_pwd	INTO v_pwd
	FROM user
	WHERE u_id = v_id;
END //
DELIMITER ;

-- ID check
DELIMITER //
CREATE PROCEDURE sp_user_idcheck
(
	IN		v_id	VARCHAR(30),
	OUT 	ck_id	TINYINT
)
BEGIN
	SELECT u_id INTO ck_id
	FROM user
	WHERE u_id = v_id;
END //
DELIMITER ;


-- ID로 유저의 정보(닉네임, 타입) 가져오기
DELIMITER //
CREATE PROCEDURE sp_user_bringinfo
(
	IN	v_id		VARCHAR(30),
	OUT	v_nickname	VARCHAR(50),
    OUT v_type		CHAR(1)
)
BEGIN
	SELECT u_nickname, u_type INTO v_nickname, v_type
	FROM user
	WHERE u_id = v_id;
END //
DELIMITER ;


-- 카페등록
DELIMITER //
CREATE PROCEDURE sp_cafe_insert
(
	IN	v_name		VARCHAR(50),
	IN	v_addr		VARCHAR(100),
	IN	v_main		VARCHAR(255),
	IN	v_menu1		VARCHAR(255),
	IN	v_menu2		VARCHAR(255),
	IN	v_open		TINYINT,
	IN	v_close		TINYINT,
	IN	v_contents	VARCHAR(255),
	IN	v_hashtag	VARCHAR(100)
)
BEGIN
	INSERT INTO cafe(c_name, c_addr, c_main, c_menu1, c_menu2, c_open, c_close, c_contents, c_hashtag)
    VALUES(v_name, v_addr, v_main, v_menu1, v_menu2, v_open, v_close, v_contents, v_hashtag);
	COMMIT;
END //
DELIMITER ;


-- 카페 소개 페이지 등록
DELIMITER //
CREATE PROCEDURE sp_cafe_intro
(
	IN	v_id	VARCHAR(30),
	OUT	v_name		VARCHAR(50),
	OUT	v_addr		VARCHAR(100),
	OUT	v_main		VARCHAR(255),
	OUT	v_menu1		VARCHAR(255),
	OUT	v_menu2		VARCHAR(255),
	OUT	v_open		TINYINT,
	OUT	v_close		TINYINT,
	OUT	v_contents	VARCHAR(255),
	OUT	v_hashtag	VARCHAR(100)
)
BEGIN
	SELECT c_name, c_addr, c_main, c_main, c_menu1, c_menu2, c_open, c_close, c_contents, c_hashtag	
    INTO v_name, v_addr, v_main, v_main, v_menu1, v_menu2, v_open, v_close, v_contents, v_hashtag
	FROM cafe
	WHERE u_id = v_id;
END //
DELIMITER ;