"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const node = require("../node");
const statusBar_1 = require("../../statusBar");
class NohlCommand extends node.CommandBase {
    constructor(args) {
        super();
        this._name = 'nohl';
        this._arguments = args;
    }
    get arguments() {
        return this._arguments;
    }
    execute(vimState) {
        return __awaiter(this, void 0, void 0, function* () {
            vimState.globalState.hl = false;
            // Clear the `match x of y` message from status bar
            statusBar_1.StatusBar.Set('', vimState.currentMode, vimState.isRecordingMacro, true);
        });
    }
}
exports.NohlCommand = NohlCommand;

//# sourceMappingURL=nohl.js.map
