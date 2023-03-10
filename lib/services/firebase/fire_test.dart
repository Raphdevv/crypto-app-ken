import 'dart:collection';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FireTest {
  addTest() {
    Map<String, dynamic> tests = HashMap();
    CollectionReference testReference =
        FirebaseFirestore.instance.collection('Testing');
    try {
      DocumentReference documentReference = testReference.doc('tests');
      tests.addAll({
        "q1": [
          {
            "problem": "ข้อที่ 1 Blockchai ทำหน้าที่อะไร",
            "g": 0,
            "Choices": [
              {
                "choice": "จัดเก็บและบันทึกข้อมูลการทำธุรกรรมการเงินดิจิทัล",
                "point": 1,
              },
              {
                "choice": "จัดเก็บและย่อยสลายข้อมูลการทำธุรกรรมการเงินดิจิทัล",
                "point": 0,
              },
              {
                "choice": "จำแนกและบันทึกข้อมูลการทำธุรกรรมการเงินดิจิทัล",
                "point": 0,
              },
              {
                "choice": "แจกจ่ายและย่อยสลายข้อมูลการทำธุรกรรมการเงินดิจิทัล",
                "point": 0,
              },
            ],
          },
          {
            "problem": "ข้อที่ 2 Blockchai มีประโยชน์อย่างไร",
            "g": 0,
            "Choices": [
              {
                "choice": "ช่วยให้รวยเร็ว",
                "point": 0,
              },
              {
                "choice": "ช่วยให้เล่นหุ้นเป็น",
                "point": 0,
              },
              {
                "choice":
                    "มีความโปร่งใส ไม่มีใครควบคุม อำนวยความสะดวกในอุตสาหกรรม",
                "point": 1,
              },
              {
                "choice":
                    "มีความโปร่งแสงเป็นบล็อกสี่เหลี่ยม สามารถมองทะลุผ่านได้",
                "point": 0,
              },
            ],
          },
          {
            "problem": "ข้อที่ 3 เหรียญใดเป็นสกุลเงินดิจิทัลแรกของโลก",
            "g": 0,
            "Choices": [
              {
                "choice": "BitDoge",
                "point": 0,
              },
              {
                "choice": "BitKub",
                "point": 0,
              },
              {
                "choice": "BitMosite",
                "point": 0,
              },
              {
                "choice": "Bitcoin",
                "point": 1,
              },
            ],
          },
          {
            "problem": "ข้อที่ 4 Stable Coin คืออะไร",
            "g": 0,
            "Choices": [
              {
                "choice":
                    "เป็นเหรียญที่ถูกตรึงไว้กับสกุลเงินที่จับต้องได้ อัตราส่วน 1:1",
                "point": 1,
              },
              {
                "choice":
                    "เป็นเหรียญที่ถูกแขวนไว้กับสกุลเงินที่จับต้องไม่ได้อัตราส่วน 1:10",
                "point": 0,
              },
              {
                "choice": "เป็นเหรียญที่ถูกบังคับให้ราคาเท่ากับ Bitcoin เสมอ",
                "point": 0,
              },
              {
                "choice": "เป็นเหรียญที่แพงที่สุดในตลาด Crypto",
                "point": 0,
              },
            ],
          },
          {
            "problem": "ข้อที่ 5 White Paper ช่วยอะไรเรา",
            "g": 0,
            "Choices": [
              {
                "choice": "ให้รู้ข้อมูลของเหรียญว่าถูกสร้างด้วยกลไกอะไร",
                "point": 1,
              },
              {
                "choice": "ให้รู้ข้อมูลของเหรียญว่าขาวหรือไม่",
                "point": 0,
              },
              {
                "choice": "ให้รู้ข้อมูลของเหรียญว่าทำมาขายทำไม",
                "point": 0,
              },
              {
                "choice": "ให้รู้ข้อมูลของเหรียญว่าจะได้กำไรอย่างแน่นอน",
                "point": 0,
              },
            ],
          },
        ],
        "q2": [
          {
            "problem": "ข้อที่ 6 ทำไมถึงควรอ่าน White Paper",
            "g": 0,
            "Choices": [
              {
                "choice": "เพื่อที่เราจะได้สบายใจ",
                "point": 0,
              },
              {
                "choice": "เพื่อรู้ว่าซื้อแล้วจะรวยตอนไหน",
                "point": 0,
              },
              {
                "choice":
                    "เพื่อที่เราจะได้ตัดสินใจได้ว่าจะลงทุนในเหรียญนั้นดีหรือไม่",
                "point": 1,
              },
              {
                "choice": "เพื่อที่เราจะได้หาเหตุผลมารองรับการลงทุนในเหรียญนี้",
                "point": 0,
              },
            ],
          },
          {
            "problem": "ข้อที่ 7 ข้อดีข้อ Crypto คืออะไร",
            "g": 0,
            "Choices": [
              {
                "choice": "ซื้อขายได้ตลอด 24 ชั่วโมง",
                "point": 1,
              },
              {
                "choice": "ทำให้เรารวยเร็วขึ้น",
                "point": 0,
              },
              {
                "choice": "ซื้อขายได้ 12 ชั่วโมง",
                "point": 0,
              },
              {
                "choice": "ทำให้เรารู้จักการลงทุน",
                "point": 0,
              },
            ],
          },
          {
            "problem": "ข้อที่ 8 ข้อเสียข้อ Crypto คืออะไร",
            "g": 0,
            "Choices": [
              {
                "choice": "ราคาแพงไม่เหมาะต่อการลงทุน",
                "point": 0,
              },
              {
                "choice": "เว็บเทรดมีแต่ภาษาอังกฤษอ่านยาก",
                "point": 0,
              },
              {
                "choice": "ราคามีความผันผวนสูงมาก (ความเสี่ยงสูง)",
                "point": 1,
              },
              {
                "choice": "ไม่โปร่งใสจริงๆมีกลโกง",
                "point": 0,
              },
            ],
          },
          {
            "problem": "ข้อที่ 9 ทำไมต้องเลือกเว็บเทรดที่ได้มาตราฐาน",
            "g": 0,
            "Choices": [
              {
                "choice": "มีความน่าเชื่อถือไม่ถูกโกงเงินได้ง่ายๆ",
                "point": 1,
              },
              {
                "choice": "เพราะมันดูเท่ห์ดี",
                "point": 0,
              },
              {
                "choice": "เพราะมีราคาซื้อขายเหรียญถูก",
                "point": 0,
              },
              {
                "choice": "เพราะมีผู้ใช้งานเป็นเพื่อนเยอะ",
                "point": 0,
              },
            ],
          },
          {
            "problem": "ข้อที่ 10  Bitkub เป็นเว็บเทรดของสัญชาติใด",
            "g": 0,
            "Choices": [
              {
                "choice": "ไทย",
                "point": 1,
              },
              {
                "choice": "ลาว",
                "point": 0,
              },
              {
                "choice": "เวียดนาม",
                "point": 0,
              },
              {
                "choice": "มาเลเซีย",
                "point": 0,
              },
            ],
          },
        ],
        "q3": [
          {
            "problem": "ข้อที่ 11 วิเคราะห์กราฟทางเทคนิคไปเพื่ออะไร",
            "g": 0,
            "Choices": [
              {
                "choice":
                    "จะได้ลงทุนในเหรียญที่พื้นฐานดี และได้มาในราคาที่เหมาะสม",
                "point": 1,
              },
              {
                "choice": "จะได้มีความรู้มากๆเอาไว้สอนคนอื่น",
                "point": 0,
              },
              {
                "choice": "จะได้ลงทุนได้อย่างไม่ลังเล",
                "point": 0,
              },
              {
                "choice": "วิเคราะห์ช่วยฝึกสมองประลองปัญญา",
                "point": 0,
              },
            ],
          },
          {
            "problem":
                "ข้อที่ 12 แนวโน้มการเคลื่อนที่ของราคา (Trend) มีอะไรบ้าง",
            "g": 0,
            "Choices": [
              {
                "choice": "แนวโน้มขาขึ้น (Uptrend)",
                "point": 0,
              },
              {
                "choice": "แนวโน้มขาลง (Downtrend)",
                "point": 0,
              },
              {
                "choice": "แนวโน้มเคลื่อนที่ไปด้านข้าง (Sideway)",
                "point": 0,
              },
              {
                "choice": "ถูกทุกข้อ",
                "point": 1,
              },
            ],
          },
          {
            "problem": "ข้อที่ 13 การควบคุมความเสี่ยงต้องทำอะไรบ้าง",
            "g": 0,
            "Choices": [
              {
                "choice": "รู้จักการ Stop loss และ Cut loss",
                "point": 0,
              },
              {
                "choice": "รู้จักกระจายการลงทุนในหลายๆเหรียญ",
                "point": 0,
              },
              {
                "choice": "รู้จักการทุ่มการลงทุนในเหรียญเดียว",
                "point": 0,
              },
              {
                "choice": "ถูกทั้ง 1 และ 2",
                "point": 1,
              },
            ],
          },
          {
            "problem": "ข้อที่ 14 บริหารเงินลงทุนยังไง",
            "g": 0,
            "Choices": [
              {
                "choice":
                    "แบ่งเงิน 10-20% จากเงินเดือนมาลงทุนไม่ควรใช้เงินทั้งหมด",
                "point": 1,
              },
              {
                "choice":
                    "แบ่งเงิน 30-40% จากเงินเดือนมาลงทุนไม่ควรใช้เงินทั้งหมด",
                "point": 0,
              },
              {
                "choice":
                    "แบ่งเงิน 50-60% จากเงินเดือนมาลงทุนไม่ควรใช้เงินทั้งหมด",
                "point": 0,
              },
              {
                "choice": "ใช้เงินทั้งหมดเพื่อลงทุน",
                "point": 0,
              },
            ],
          },
          {
            "problem": "ข้อที่ 15 เงินเย็นคืออะไร",
            "g": 0,
            "Choices": [
              {
                "choice": "เงินแช่น้ำแข็ง",
                "point": 0,
              },
              {
                "choice": "เงิน 0 องศาสัมบูรณ์",
                "point": 0,
              },
              {
                "choice": "เงินที่ไม่มีความจำเป็นต้องใช้",
                "point": 1,
              },
              {
                "choice": "เงินที่ต้องใช้เย็นนี้",
                "point": 0,
              },
            ],
          },
        ]
      });
      documentReference.set(tests).then((value) {
        log('YES!!');
      });
    } on FirebaseException catch (e) {
      log('${e.message}');
    }
  }
}
