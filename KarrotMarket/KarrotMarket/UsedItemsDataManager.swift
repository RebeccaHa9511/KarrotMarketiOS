//
//  UsedItemsDataManager.swift
//  KarrotMarket
//
//  Created by Rebecca Ha on 2022/07/18.
//

import UIKit


class UsedItemsDataManager {
    //일반적인 데이터 매니저는 빈배열로 시작하고 서버에서 통신한 결과를 빈 배열에 받음.
    var usedItemsDataArray: [UsedItems] = []

    
    func makeUsedItemsData() {
        
        usedItemsDataArray = [
            UsedItems.init(usedItemsImg: Image(withImage: UIImage(named: "인형")!), usedItemsTitle: "아이폰 xs 삽니다 온천장역 부산대역 전포동 부전역", usedItemsPrice: "250,000원", usedItemsLocation: "장전제2동", usedItemsLastUpdate: "2분전", content: "아이폰xs", views: 4, category: "삽니다"),

            UsedItems.init(usedItemsImg: Image(withImage: UIImage(named: "인형")!), usedItemsTitle: "엔틱 프랑스 비스크돌 30년 넘은것", usedItemsPrice: "280,000원", usedItemsLocation: "온천동", usedItemsLastUpdate: "끌올 4분전", content: "문의주세요", views: 661, category: "가구/인테리어"),

            UsedItems.init(usedItemsImg: Image(withImage: UIImage(named: "인덕션")!), usedItemsTitle: "매직쉐프 인덕션1구활용만점거의새것(이가격에안하시면 제가쓸게요)", usedItemsPrice: "52,000원", usedItemsLocation: "수안동", usedItemsLastUpdate: "끌올 1분전", content: "가지러오셔야합니다", views: 242, category: "생활가전"),

            UsedItems.init(usedItemsImg: Image(withImage: UIImage(named: "메이플")!), usedItemsTitle: "메이플빵 띠부씰 스티커 교환합니다", usedItemsPrice: "", usedItemsLocation: "장전제3동", usedItemsLastUpdate: "7분전", content: "띠부씰 교환원합니다 챗주세요.", views: 666, category: "기타 중고물품"),

            UsedItems.init(usedItemsImg: Image(withImage: UIImage(named: "꽃게")!), usedItemsTitle: "마지막 한철장사 가겠습니다 국내산 꽃게 1kg 15,000원...", usedItemsPrice: "", usedItemsLocation: "명지동", usedItemsLastUpdate: "광고", content: "국내산 꽃게 저렴하게 판매합니다~ 많은 연락부탁드립니다!", views: 3211, category: "생활/가공식품"),

            UsedItems.init(usedItemsImg: Image(withImage: UIImage(named: "네이처하이크")!), usedItemsTitle: "네이처하히크 헥사 타프+추가 폴(전부 미사용)", usedItemsPrice: "100,000원", usedItemsLocation: "사직동", usedItemsLastUpdate: "1일전", content: "미사용 풀박입니다. 가지러오셔야 합니다.", views: 873, category: "스포츠/레저"),
            UsedItems.init(usedItemsImg: Image(withImage: UIImage(named: "나이키")!), usedItemsTitle: "나이키 에어포스 280 팝니다.", usedItemsPrice: "30,000원", usedItemsLocation: "장전제2동", usedItemsLastUpdate: "3분전", content: "몇번 안신었습니다. 연락주세요", views: 559, category: "남성패션/잡화")

        ]
        

    }
    
    
    
    func getUsedItemsData() -> [UsedItems] {
        return usedItemsDataArray
    }
    
    // 새로운 게시글 만들기
    func makeNewUsedItem(_ useditem: UsedItems) {
        usedItemsDataArray.append(useditem)

        print("추가되었습니다")
    }
    
    // 기존 멤버의 정보 업데이트
    func updateUsedItemsInfo(index: Int, _ useditem: UsedItems) {
        usedItemsDataArray[index] = useditem
    }
    
}
