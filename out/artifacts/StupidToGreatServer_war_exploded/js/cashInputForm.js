window.onload = function () {
    $('#menu1').empty();

    $('#menu1').append(
        "<option value=\"\" disabled selected>-</option>"
    );

    $('#menu1').append(
        "<option class=\"item\" data-value=\"eatout\">외식</option>\n" +
        "<option class=\"item\" data-value=\"market\">마켓/편의점</option>\n" +
        "<option class=\"item\" data-value=\"shop\">쇼핑</option>\n" +
        "<option class=\"item\" data-value=\"trans\">교통</option>\n" +
        "<option class=\"item\" data-value=\"life\">생활비</option>\n" +
        "<option class=\"item\" data-value=\"interest\">문화생활</option>\n" +
        "<option class=\"item\" data-value=\"etc\">기타</option>");

    $('#menu1').on('change', function() {
        $('#menu2').empty();
        $('#menu3').empty();
        $('#menu2').append(
            "<option value=\"\" disabled selected>-</option>"
        );
        var cate = $('#menu1').val();

        if(cate == "외식"){
            $('#menu2').append(
                "<option class=\"item\" data-value=\"카페,디저트\">카페,디저트</option>\n" +
                "<option class=\"item\" data-value=\"술집\">술집</option>\n" +
                "<option class=\"item\" data-value=\"양식\">양식</option>\n" +
                "<option class=\"item\" data-value=\"기타\">기타</option>"
            )
        }
        else if(cate == "마켓/편의점"){
            $('#menu2').append(
                "<option class=\"item\" data-value=\"생활,편의\">생활,편의</option>\n" +
                "<option class=\"item\" data-value=\"기타\">기타</option>"
            )
        }
        else if(cate == "쇼핑") {
            $('#menu2').append(
                "<option class=\"item\" data-value=\"쇼핑,유통\">쇼핑,유통</option>\n" +
                "<option class=\"item\" data-value=\"기타\">기타</option>"
            )
        }
        else if(cate == "문화생활"){
            $('#menu2').append(
                "<option class=\"item\" data-value=\"문화,예술\">문화,예술</option>\n" +
                "<option class=\"item\" data-value=\"기타\">기타</option>"
            )
        }
        else if(cate == "생활비"){
            $('#menu2').append(
                "<option class=\"item\" data-value=\"병원,의원\">병원,의원</option>\n" +
                "<option class=\"item\" data-value=\"기타\">기타</option>"
            )
        }
        else if(cate == "교통"){
            $('#menu2').append(
                "<option class=\"item\" data-value=\"주유소\">주유소</option>\n" +
                "<option class=\"item\" data-value=\"기타\">기타</option>"
            )
        }
    });

    $('#menu2').on('change', function() {
        $('#menu3').empty();
        var cate = $('#menu2').val();

        if(cate == "카페,디저트"){
            $('#menu3').append(
                "<option class=\"item\" data-value=\"카페\">카페</option>\n"+
                "<option class=\"item\" data-value=\"기타\">기타</option>\n"
            )
        }
        else if(cate == "생활,편의"){
            $('#menu3').append(
                "<option class=\"item\" data-value=\"편의점\">편의점</option>\n" +
                "<option class=\"item\" data-value=\"미용실\">미용실</option>\n"+
                "<option class=\"item\" data-value=\"기타\">기타</option>\n"
            )
        }
        else if(cate == "술집"){
            $('#menu3').append(
                "<option class=\"item\" data-value=\"요리주점\">요리주점</option>\n"+
                "<option class=\"item\" data-value=\"기타\">기타</option>\n"
            )
        }
        else if(cate == "양식"){
            $('#menu3').append(
                "<option class=\"item\" data-value=\"햄버거\">햄버거</option>\n"+
                "<option class=\"item\" data-value=\"기타\">기타</option>\n"
            )
        }
        else if(cate == "쇼핑,유통"){
            $('#menu3').append(
                "<option class=\"item\" data-value=\"서점\">서점</option>\n"+
                "<option class=\"item\" data-value=\"기타\">기타</option>\n"
            )
        }
        else if(cate == "문화,예술"){
            $('#menu3').append(
                "<option class=\"item\" data-value=\"영화관\">영화관</option>\n"+
                "<option class=\"item\" data-value=\"기타\">기타</option>\n"
            )
        }
        else if(cate == "기타"){
            $('#menu3').append(
                "<option class=\"item\" data-value=\"기타\">기타</option>\n"
            )
        }
    });
};