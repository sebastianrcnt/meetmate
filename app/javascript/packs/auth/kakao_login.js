const main = async () => {
    Kakao.init("4ee9aa31e8608c2ce29eedd51d2b4733");
    console.log("kakao init: ", Kakao.isInitialized());

    const kakaoLoginButton = document.getElementById("kakao-login");
    kakaoLoginButton.addEventListener("click", handleKakaoLoginClick);
};

const handleKakaoLoginClick = () => {
    Kakao.Auth.authorize({
        redirectUri: `http://192.168.0.34:3000/auth/kakao_login_code`,
    });
};

main();
