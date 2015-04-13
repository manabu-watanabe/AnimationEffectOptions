//
//  ViewController.swift
//  AnimationEffectOptions
//
//  Created by 渡部学 on 2015/03/24.
//  Copyright (c) 2015年 watanabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate, Option {
    
    var containerView: UIView!
    
    var moveView: UIView = UIView(frame: CGRectMake(0, 0, 100, 100))
    var addView: UIView = UIView(frame: CGRectMake(0, 0, 100, 100))

    
    var selectOption: Int = -1
    var effectnameCell: UITableViewCell = UITableViewCell()
    let isEffect: UISwitch = UISwitch()
    let settingList: UITableView = UITableView(frame: CGRectMake(0, 0, 0, 300), style: UITableViewStyle.Plain)
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        self.containerView = UIView(frame: CGRectMake(10, 10, UIScreen.mainScreen().bounds.width - 20 , UIScreen.mainScreen().bounds.height - 220))
        self.containerView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(self.containerView)

        initAnimation()
        
        self.settingList.frame = CGRectMake(10, UIScreen.mainScreen().bounds.height - 200, self.containerView.frame.width,
            180)
        self.settingList.separatorStyle = UITableViewCellSeparatorStyle.None
        self.settingList.bounces = false
        self.settingList.dataSource = self
        self.settingList.delegate = self
        self.settingList.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.settingList)

        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        
        switch indexPath.row {
        case 0:
            // Option
            self.effectnameCell = cell
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell.textLabel?.text = "Effectを選択して下さい。"
            cell.textLabel?.textAlignment = NSTextAlignment.Center
        case 1:
            // オン・オフ
            cell.textLabel?.text = "Effect:"
            self.isEffect.frame.origin.x = cell.frame.width - 10 - self.isEffect.frame.width
            self.isEffect.frame.origin.y = (cell.frame.height / 2) - (self.isEffect.frame.height / 2)
            cell.contentView.addSubview(self.isEffect)
        case 2:
            // 開始
            cell.textLabel?.text = "Start"
            cell.textLabel?.textAlignment = NSTextAlignment.Center
            
        case 3:
            // Reset
            cell.textLabel?.text = "Reset"
            cell.textLabel?.textAlignment = NSTextAlignment.Center
            
        default:
            println("eror row")
        }
        
        return cell
    }
    
    func onAnimation() {
        
        switch self.selectOption + 1 {
        case 1:
            animation01(self.isEffect.on)
        case 2:
            animation02(self.isEffect.on)
        case 3:
            animation03(self.isEffect.on)
        case 4:
            animation04(self.isEffect.on)
        case 5:
            animation05(self.isEffect.on)
        case 6:
            animation06(self.isEffect.on)
        case 7:
            animation07(self.isEffect.on)
        case 8:
            animation08(self.isEffect.on)
        case 9:
            animation09(self.isEffect.on)
        case 10:
            animation10(self.isEffect.on)
        case 11:
            animation11(self.isEffect.on)
        case 12:
            animation12(self.isEffect.on)
        case 13:
            animation13(self.isEffect.on)
        case 14:
            animation14(self.isEffect.on)
        case 15:
            animation15(self.isEffect.on)
        case 16:
            animation16(self.isEffect.on)
        case 17:
            animation17(self.isEffect.on)
        case 18:
            animation18(self.isEffect.on)
        case 19:
            animation19(self.isEffect.on)
        case 20:
            animation20(self.isEffect.on)
        case 21:
            animation21(self.isEffect.on)
        case 22:
            animation22(self.isEffect.on)
        default:
            println("対象以外のアニメーション")
        }
    }
    
    // オプションリストで選択された値で書き換え。
    func change(val:Int, txt: String) {
        self.selectOption = val
        self.effectnameCell.textLabel?.text = txt
    }
    
    // 選択した場所で処理を変える。
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            onOptionSelect()
        case 2:
            onAnimation()
        case 3:
            initAnimation()
        default:
            println("eror row")
        }
    }

    // スイッチがある場所は選択させたくないので、nilをかえすようにする。
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if (indexPath.row == 1) {
            return nil
        }
        return indexPath
    }
    
    func onOptionSelect() {
        // 遷移するViewを定義する.
        let optionList: OptionListView = OptionListView()
        
        optionList.optionTarget = self
        
        
        optionList.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        // Viewの移動する.
        self.presentViewController(optionList, animated: true, completion: nil)
    }
    
    func initAnimation() {
        
        self.containerView.addSubview(self.addView)
        self.addView.hidden = true
        self.addView.frame = CGRectMake(self.containerView.frame.width / 2 - 25, self.containerView.frame.height / 2 - 25, 50, 50)
        self.addView.backgroundColor = UIColor.orangeColor()
        
        
        
        self.containerView.addSubview(self.moveView)
        self.moveView.hidden = false
        self.moveView.frame = CGRectMake(self.containerView.frame.width / 2 - 50, self.containerView.frame.height / 2 - 50, 100, 100)
        self.moveView.backgroundColor = UIColor.greenColor()
        
    }
    
    // 親ビューと一緒にアニメーションするように、コミット時にサブビューを配置します。(※)
    func animation01(isAnimation: Bool) {
        
    }
    
    // アニメーションの最中にタップイベントを取得できる。
    func animation02(isAnimation: Bool) {
        
        initAnimation()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "onTap:")
        self.moveView.addGestureRecognizer(tap)
        
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.TransitionCurlDown
        } else {
            opt = UIViewAnimationOptions.TransitionCurlDown | UIViewAnimationOptions.AllowUserInteraction
        }
        
        UIView.transitionWithView(
            self.moveView, // 対象のビュー
            duration: 5,  // アニメーションの時間
            options: opt, // アニメーション変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
                self.moveView.backgroundColor = UIColor.redColor()
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
        })
    }
    
    func onTap(sender: UITapGestureRecognizer) {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        println("onTap:\(formatter.stringFromDate(NSDate()))")
    }
    
    // アニメーションの最中に割り込みで別のアニメーションが発生した場合に、
    // 最初に実行したアニメーションが割り込みした直後の状態から、割り込みした状態後の状態へアニメーションを行う。
    func animation03(isAnimation: Bool) {
        initAnimation()
        
        UIView.animateWithDuration(
            3, // アニメーションの時間
            delay: 0, // アニメーションの遅延時間
            options: UIViewAnimationOptions.CurveEaseInOut, // アニメーションの変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
                self.moveView.frame.origin.x = self.containerView.frame.width - self.moveView.frame.width
                self.moveView.backgroundColor =  UIColor.blueColor()
                
            },
            completion: {(finished: Bool) -> Void in
        })
        
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.CurveEaseInOut
        } else {
            opt = UIViewAnimationOptions.CurveEaseInOut | UIViewAnimationOptions.BeginFromCurrentState
        }
        
        self.moveView.backgroundColor =  UIColor.yellowColor()
        UIView.animateWithDuration(
            2, // アニメーションの時間
            delay: 0, // アニメーションの遅延時間
            options: opt, // アニメーションの変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
                self.moveView.frame.origin.x = self.containerView.frame.width / 2
                self.moveView.backgroundColor =  UIColor.redColor()
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
        })
        
    }
    
    // アニメーションを無限に繰り返す。
    func animation04(isAnimation: Bool) {
        initAnimation()
        self.moveView.frame.origin.x = 0
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (isAnimation) {
            opt = UIViewAnimationOptions.Repeat
        }
        
        UIView.animateWithDuration(
            1, // アニメーションの時間
            delay: 0.5, // アニメーションの遅延時間
            options: opt, // アニメーションの変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
                self.moveView.frame.origin.x = self.containerView.frame.width - self.moveView.frame.width
                self.moveView.backgroundColor = UIColor.redColor()
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
        })
    }
    
    // animationsで指定された状態になった後、一度最初の状態に戻り、その後アニメーションなしでanimationsで指定された状態になる。
    func animation05(isAnimation: Bool) {
        
        initAnimation()
        self.moveView.frame.origin.x = 0
        
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (isAnimation) {
            opt = UIViewAnimationOptions.Autoreverse
        }
        
        UIView.animateWithDuration(
            3, // アニメーションの時間
            delay: 0.5, // アニメーションの遅延時間
            options: opt, // アニメーションの変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
                self.moveView.frame.origin.x = self.containerView.frame.width - self.moveView.frame.width
                self.moveView.backgroundColor = UIColor.redColor()
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
        })
    }
    
    // 直前のアニメーションの時間をキャンセルし、指定した時間でアニメーションを実施します
    func animation06(isAnimation: Bool) {
        initAnimation()
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        println("1:\(formatter.stringFromDate(NSDate()))")
        self.moveView.frame.origin.x = self.containerView.frame.width / 2
        
        
        
        UIView.animateWithDuration(
            1, // アニメーションの時間
            delay: 0.5, // アニメーションの遅延時間
            options: UIViewAnimationOptions.CurveEaseInOut, // アニメーションの変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
                self.moveView.frame.origin.x = self.containerView.frame.height / 3 * 2
                self.moveView.frame.origin.y = 0
                self.moveView.backgroundColor = UIColor.redColor()
                
                
                var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
                if (!isAnimation) {
                    opt = UIViewAnimationOptions.CurveEaseOut
                } else {
                    opt = UIViewAnimationOptions.CurveEaseOut | UIViewAnimationOptions.OverrideInheritedDuration
                }
                
                UIView.animateWithDuration(
                    5, // アニメーションの時間
                    delay: 0.5, // アニメーションの遅延時間
                    options: opt, // アニメーションの変化オプション
                    animations: {() -> Void  in
                        // アニメーションする処理
                        self.moveView.frame.origin.x = self.containerView.frame.width / 2 - self.moveView.frame.width / 2
                        self.moveView.frame.origin.y = self.containerView.frame.height - self.moveView.frame.height
                        self.moveView.backgroundColor = UIColor.blueColor()
                    },
                    completion: {(finished: Bool) -> Void in
                        println("2:\(formatter.stringFromDate(NSDate()))")
                })
            },
            completion: {(finished: Bool) -> Void in
                println("3:\(formatter.stringFromDate(NSDate()))")
        })
    }
    
    // 直前のアニメーションのタイミング曲線の値をキャセルし、指定したタイミング曲線値でアニメーションを実施します。
    func animation07(isAnimation: Bool) {
        initAnimation()
        
        UIView.animateWithDuration(
            1.5, // アニメーションの時間
            delay: 0.5, // アニメーションの遅延時間
            options: UIViewAnimationOptions.CurveEaseInOut, // アニメーションの変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
                self.moveView.frame.origin.x = self.containerView.frame.height / 3 * 2
                self.moveView.frame.origin.y = 0
                self.moveView.backgroundColor = UIColor.redColor()
                
                
                var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
                if (!isAnimation) {
                    opt = UIViewAnimationOptions.CurveEaseOut
                } else {
                    opt = UIViewAnimationOptions.CurveEaseOut | UIViewAnimationOptions.OverrideInheritedCurve
                }
                
                UIView.animateWithDuration(
                    3, // アニメーションの時間
                    delay: 0.5, // アニメーションの遅延時間
                    options: opt, // アニメーションの変化オプション
                    animations: {() -> Void  in
                        // アニメーションする処理
                        self.moveView.frame.origin.x = self.containerView.frame.width / 2 - self.moveView.frame.width / 2
                        self.moveView.frame.origin.y = self.containerView.frame.height - self.moveView.frame.height
                        self.moveView.backgroundColor = UIColor.blueColor()
                    },
                    completion: {(finished: Bool) -> Void in
                        
                })
            },
            completion: {(finished: Bool) -> Void in
                
        })
        
    }
    
    // アニメーションの最中にVIEWが赤くなっていく
    func animation08(isAnimation: Bool) {
        
        initAnimation()
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.TransitionCurlDown
        } else {
            opt = UIViewAnimationOptions.TransitionCurlDown | UIViewAnimationOptions.AllowAnimatedContent
        }
        
        UIView.transitionWithView(
            self.moveView, // 対象のビュー
            duration: 3,  // アニメーションの時間
            options: opt, // アニメーション変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
                self.moveView.backgroundColor = UIColor.redColor()
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
        })
    }
    
    // トランジションメソッドで使用します。遷移する際に非表示にします。
    func animation09(isAnimation: Bool) {
        initAnimation()
        
        self.addView.hidden = true
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.TransitionFlipFromTop
        } else {
            opt = UIViewAnimationOptions.TransitionFlipFromTop | UIViewAnimationOptions.ShowHideTransitionViews
        }
        
        UIView.transitionFromView(
            self.moveView,
            toView: self.addView,
            duration: 1,
            options: opt, // アニメーション変化オプション,
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
                println(self.moveView.hidden)
        })
    }
    
    
    
    // 直前のアニメーションオプションを継承しない。(※)
    func animation10(isAnimation: Bool) {
    }
    
    // ゆっくり始まり、一定の速度で進み、ゆっくり終わる。(デフォルト)
    func animation11(isAnimation: Bool) {
        
        initAnimation()
        self.moveView.frame.origin.x = 0
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.CurveLinear
        } else {
            opt = UIViewAnimationOptions.CurveEaseInOut
        }
        
        UIView.animateWithDuration(
            3, // アニメーションの時間
            delay: 0.5, // アニメーションの遅延時間
            options: opt, // アニメーションの変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
                self.moveView.frame.origin.x = self.containerView.frame.width - self.moveView.frame.width
                self.moveView.backgroundColor = UIColor.redColor()
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
        })
    }
    
    // ゆっくり始まり、後は一定の速度で進む
    func animation12(isAnimation: Bool) {
        initAnimation()
        self.moveView.frame.origin.x = 0
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.CurveLinear
        } else {
            opt = UIViewAnimationOptions.CurveEaseIn
        }
        
        UIView.animateWithDuration(
            3, // アニメーションの時間
            delay: 0.5, // アニメーションの遅延時間
            options: opt, // アニメーションの変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
                self.moveView.frame.origin.x = self.containerView.frame.width - self.moveView.frame.width
                self.moveView.backgroundColor = UIColor.redColor()
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
        })
    }
    

    
    // 一定の速度で進み、 ゆっくり終わる
    func animation13(isAnimation: Bool) {
        
        initAnimation()
        self.moveView.frame.origin.x = 0
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.CurveLinear
        } else {
            opt = UIViewAnimationOptions.CurveEaseOut
        }
        
        UIView.animateWithDuration(
            3, // アニメーションの時間
            delay: 0.5, // アニメーションの遅延時間
            options: opt, // アニメーションの変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
                self.moveView.frame.origin.x = self.containerView.frame.width - self.moveView.frame.width
                self.moveView.backgroundColor = UIColor.redColor()
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
        })
    }
    
    // 一定の速度で進む
    func animation14(isAnimation: Bool) {
        initAnimation()
        self.moveView.frame.origin.x = 0
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.CurveEaseInOut
        } else {
            opt = UIViewAnimationOptions.CurveLinear
        }
        
        UIView.animateWithDuration(
            3, // アニメーションの時間
            delay: 0.5, // アニメーションの遅延時間
            options: opt, // アニメーションの変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
                self.moveView.frame.origin.x = self.containerView.frame.width - self.moveView.frame.width
                self.moveView.backgroundColor = UIColor.redColor()
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
        })
    }
    
    // トランジションメソッドで使用します。何もしません。(デフォルト)
    func animation15(isAnimation: Bool) {
        initAnimation()
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.TransitionFlipFromLeft
        } else {
            opt = UIViewAnimationOptions.TransitionNone
        }
        
        UIView.transitionWithView(
            self.moveView, // 対象のビュー
            duration: 1,  // アニメーションの時間
            options: opt, // アニメーション変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
                self.moveView.backgroundColor = UIColor.redColor()
        })
    }
    
    // トランジションメソッドで使用します。左辺が手前に回って右辺になるようなアニメーションです。
    func animation16(isAnimation: Bool) {
        initAnimation()
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.TransitionNone
        } else {
            opt = UIViewAnimationOptions.TransitionFlipFromLeft
        }
        
        UIView.transitionWithView(
            self.moveView, // 対象のビュー
            duration: 1,  // アニメーションの時間
            options: opt, // アニメーション変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
                self.moveView.backgroundColor = UIColor.redColor()
        })
    }
    
    // トランジションメソッドで使用します。左辺が背後に回って右辺になるようなアニメーションです。
    func animation17(isAnimation: Bool) {
        initAnimation()
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.TransitionNone
        } else {
            opt = UIViewAnimationOptions.TransitionFlipFromRight
        }
        
        UIView.transitionWithView(
            self.moveView, // 対象のビュー
            duration: 1,  // アニメーションの時間
            options: opt, // アニメーション変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
                self.moveView.backgroundColor = UIColor.redColor()
        })
    }
    

    
    // トランジションメソッドで使用します。ページをめくり上げる様なアニメーションです。
    func animation18(isAnimation: Bool) {
        initAnimation()
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.TransitionNone
        } else {
            opt = UIViewAnimationOptions.TransitionCurlUp
        }
        
        UIView.transitionWithView(
            self.moveView, // 対象のビュー
            duration: 1,  // アニメーションの時間
            options: opt, // アニメーション変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
                self.moveView.backgroundColor = UIColor.redColor()
        })
    }
    
    // トランジションメソッドで使用します。ページをめくり下げる様なアニメーションです。
    func animation19(isAnimation: Bool) {
        
        initAnimation()
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.TransitionNone
        } else {
            opt = UIViewAnimationOptions.TransitionCurlDown
        }
        
        UIView.transitionWithView(
            self.moveView, // 対象のビュー
            duration: 1,  // アニメーションの時間
            options: opt, // アニメーション変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
                self.moveView.backgroundColor = UIColor.redColor()
        })
    }
    

    // トランジションメソッドで使用します。クロスディゾルブ、じわっと現れるようなアニメーションです。
    func animation20(isAnimation: Bool) {
        
        initAnimation()
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.TransitionNone
        } else {
            opt = UIViewAnimationOptions.TransitionCrossDissolve
        }
        
        UIView.transitionWithView(
            self.moveView, // 対象のビュー
            duration: 1,  // アニメーションの時間
            options: opt, // アニメーション変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
                self.moveView.backgroundColor = UIColor.redColor()
        })
        
    }
    
    // トランジションメソッドで使用します。上底が手前に回って下底になる様なアニメーションです。
    func animation21(isAnimation: Bool) {
        initAnimation()
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.TransitionNone
        } else {
            opt = UIViewAnimationOptions.TransitionFlipFromTop
        }
        
        UIView.transitionWithView(
            self.moveView, // 対象のビュー
            duration: 1,  // アニメーションの時間
            options: opt, // アニメーション変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
                self.moveView.backgroundColor = UIColor.redColor()
        })
    }
    
    // トランジションメソッドで使用します。上底が手前に回って下底になる様なアニメーションです。
    func animation22(isAnimation: Bool) {
        initAnimation()
        
        var opt: UIViewAnimationOptions = UIViewAnimationOptions.allZeros
        if (!isAnimation) {
            opt = UIViewAnimationOptions.TransitionNone
        } else {
            opt = UIViewAnimationOptions.TransitionFlipFromBottom
        }
        
        UIView.transitionWithView(
            self.moveView, // 対象のビュー
            duration: 1,  // アニメーションの時間
            options: opt, // アニメーション変化オプション
            animations: {() -> Void  in
                // アニメーションする処理
            },
            completion: {(finished: Bool) -> Void in
                // アニメーション終了後の処理
                self.moveView.backgroundColor = UIColor.redColor()
        })
    }


}

