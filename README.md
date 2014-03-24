# TWLEncoder

Helps with creating MPEG-1 Layer 2 (.mp2) audio files in Cocoa and iOS apps.

## Usage

TWLEncoder works similarly to the `NSURLSession` library that was introduced in iOS 7. You use configure an encoder, and use it to create and runs tasks. Information about the encoder and its tasks is communicated to delegates. Behind the scenese the tasks are processed in an operation queue.

One of the primary uses of MP2 audio is in broadcast systems for public radio in the United States. `TWLEncoder` comes with a basic configuration that should work with most systems. You could customize that configuration before using it, or build a configuration from scratch to meet your needs.

### Building an encoder

    TWLEncoderConfiguration *config = TWLEncoderConfiguration.publicRadioConfiguration;
    TWLEncoder *encoder = [TWLEncoder encoderWithConfiguration:config delegate:self operationQueue:nil];

### Creating a task

    NSURL *fileURL = [NSURL fileURLWithPath:@"~/Desktop/master-2014_02_19-b.wav"];
    TWLEncoderTask *task = [encoder taskWithURL:fileURL];
    [task resume]; // Tasks start suspended and must be resumed to begin

### Delegate

    - (void)encoder:(TWLEncoder *)encoder task:(TWLEncoderTask *)task didWriteFrames:(int64_t)framesWritten totalFramesWritten:(int64_t)totalFramesWritten totalFrameExpectedToWrite:(int64_t)totalFramesExpectedToWrite bytesWritten:(int64_t)bytessWritten totalBytesWritten:(int64_t)totalBytesWritten {
      // eg Update a progress bar in the UI
    }

    - (void)encoder:(TWLEncoder *)encoder task:(TWLEncoderTask *)task didFinishEncodingToURL:(NSURL *)location {
      // eg Copy the encoded file to a permanent location
      // The temporary file that the encoding was written to will be removed as soon
      // as this method returns, so you must read or relocate the data before then.
    }
