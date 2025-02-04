// Script1.cdc

import HelloWorld from 0x02

// A script is a special type of Cadence transaction
// that does not have access to any account's storage
// and cannot modify state. Any state changes that it would
// do are reverted after execution.
//
// Scripts must have the following signature: pub fun main()import HelloWorld from 0x02
    
pub fun main() {

    // Cadence code can get an account's public account object
    // by using the getAccount() built-in function.
    let helloAccount = getAccount(0x02)

    // Get the public capability from the public path of the owner's account
    let helloCapability = helloAccount.getCapability<&HelloWorld.HelloAsset>(/public/HelloAssetTutorial)

    // borrow a reference for the capability
    let helloReference = helloCapability.borrow()
        ?? panic("Could not borrow a reference to the hello capability")

    // The log built-in function logs its argument to stdout.
    //
    // Here we are using optional chaining to call the "hello"
    // method on the HelloAsset resource that is referenced
    // in the published area of the account.
    log(helloReference.hello())
}